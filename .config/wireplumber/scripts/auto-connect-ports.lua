function link_port(output_port, input_port)
	if not input_port or not output_port then
		return nil
	end

	local link_args = {
		["link.input.node"] = input_port.properties["node.id"],
		["link.input.port"] = input_port.properties["object.id"],

		["link.output.node"] = output_port.properties["node.id"],
		["link.output.port"] = output_port.properties["object.id"],

		-- The node never got created if it didn't have this field set to something
		["object.id"] = nil,

		-- I was running into issues when I didn't have this set
		["object.linger"] = true,

		["node.description"] = "Link created by auto_connect_ports",
	}

	local link = Link("link-factory", link_args)
	link:activate(1)

	return link
end

function auto_connect_ports(args)
	local output_om = ObjectManager({
		Interest({
			type = "port",
			args["output"],
			Constraint({ "port.direction", "equals", "out" }),
		}),
	})

	local links = {}

	local input_om = ObjectManager({
		Interest({
			type = "port",
			args["input"],
			Constraint({ "port.direction", "equals", "in" }),
		}),
	})

	local all_links = ObjectManager({
		Interest({
			type = "link",
		}),
	})

	local unless = nil

	if args["unless"] then
		unless = ObjectManager({
			Interest({
				type = "port",
				args["unless"],
				Constraint({ "port.direction", "equals", "in" }),
			}),
		})
	end

	function _connect()
		local delete_links = unless and unless:get_n_objects() > 0

		if delete_links then
			for _i, link in pairs(links) do
				link:request_destroy()
			end

			links = {}

			return
		end

		for output_name, input_names in pairs(args.connect) do
			local input_names = input_names[1] == nil and { input_names } or input_names

			if delete_links then
			else
				-- Iterate through all the output ports with the correct channel name
				for output in output_om:iterate({ Constraint({ "audio.channel", "equals", output_name }) }) do
					for _i, input_name in pairs(input_names) do
						-- Iterate through all the input ports with the correct channel name
						for input in input_om:iterate({ Constraint({ "audio.channel", "equals", input_name }) }) do
							-- Link all the nodes
							local link = link_port(output, input)

							if link then
								table.insert(links, link)
							end
						end
					end
				end
			end
		end
	end

	output_om:connect("object-added", _connect)
	input_om:connect("object-added", _connect)
	all_links:connect("object-added", _connect)

	output_om:activate()
	input_om:activate()
	all_links:activate()

	if unless then
		unless:connect("object-added", _connect)
		unless:connect("object-removed", _connect)
		unless:activate()
	end
end

auto_connect_ports({
	-- Physical mic
	output = Constraint({ "object.path", "matches", "alsa:acp:Device:*" }),
	input = Constraint({ "object.path", "matches", "capture.rnnoise_source:*" }),
	connect = {
		["FL"] = "MONO",
	},
})

-- Block my-source → capture.rnnoise_source
auto_connect_ports({
	output = Constraint({ "object.path", "matches", "my-source:*" }),
	input = Constraint({ "object.path", "matches", "capture.rnnoise_source:*" }),
	-- This ensures NO links are made between my-source and capture.rnnoise_source
	unless = Constraint({ "object.path", "matches", "this-will-never-exist:*" }), -- Fake condition to force deletion
	connect = {}, -- Empty connect table means no links are created, but the rule still runs
})

auto_connect_ports({
	output = Constraint({ "object.path", "matches", "my-sink:*" }),
	input = Constraint({ "object.path", "matches", "my-source:*" }),
	connect = {
		["FL"] = "FL",
		["FR"] = "FR",
	},
})

auto_connect_ports({
	output = Constraint({ "object.path", "matches", "rnnoise_source:*" }),
	input = Constraint({ "object.path", "matches", "my-sink:*" }),
	connect = {
		["MONO"] = { "FL", "FR" },
	},
})
