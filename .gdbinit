source /usr/share/pwndbg/gdbinit.py
source /home/acol/splitmind/gdbinit.py

set memory-code-color gray
set memory-heap-color green
set syntax-highlight-style one-dark

set context-code-lines 15
set context-source-code-lines 30
set context-clear-screen on
set follow-fork-mode parent
set context-stack-lines 10
set show-flags on

python
import splitmind
(splitmind.Mind()
  .tell_splitter(show_titles=True)
  .tell_splitter(set_title="Main")
  .right(display="backtrace", size="21%")
  .left(of="main", display="disasm", size="39%")
  .below(display="code", size="31")
  .above(of="main", display="stack", size="85%")
  .above(display="legend", size="22")
  .show("regs", on="legend")
  .below(of="backtrace", display="expressions", size="40%")
  .below(of="stack", size="6")
).build(nobanner=True)
end
