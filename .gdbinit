set auto-load safe-path /

source /usr/share/pwndbg/gdbinit.py

set memory-code-color gray
set memory-heap-color green
set syntax-highlight-style catppuccin-mocha
set disassembly-flavor intel
set show-compact-regs on

set debuginfod enabled on

tui new-layout full {-horizontal { { -horizontal { pwndbg_code 1 cmd 1 } 2 { {-horizontal pwndbg_legend 8 pwndbg_control 2 } 1 pwndbg_regs 6 pwndbg_stack 6 } 3 } 7 pwndbg_disasm 3 } 3 { pwndbg_backtrace 1 pwndbg_threads 1 pwndbg_expressions 2 } 1 } 1 status 1

tui new-layout pwn_code -horizontal { {-horizontal pwndbg_threads 2 pwndbg_code 8 } 5 cmd 5 } 8 { pwndbg_expressions 7 pwndbg_backtrace 3 } 2

tui new-layout pwn_simple -horizontal cmd 8 { pwndbg_expressions 7 pwndbg_backtrace 3 } 2

define setup
    if $arg0 == 0
        tui disable
        set context-sections backtrace threads args stack regs disasm code expressions
    end

    if $arg0 == 1
        lay pwn_simple
        set context-sections expressions backtrace threads args stack regs disasm code 
        focus cmd
    end

    if $arg0 == 2
        lay pwn_code
        set context-sections expressions code backtrace threads regs disasm 
        focus cmd
    end 

    if $arg0 == 3
        lay full
        set context-sections backtrace threads args regs disasm code stack expressions
        focus cmd
    end 
end

setup 1
