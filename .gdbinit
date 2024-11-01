set auto-load safe-path /

source /usr/share/pwndbg/gdbinit.py

set memory-code-color gray
set memory-heap-color green
set syntax-highlight-style one-dark
set disassembly-flavor intel

set debuginfod enabled on

tui new-layout pwndbg {-horizontal { { -horizontal { pwndbg_code 1 cmd 1 } 2 { {-horizontal pwndbg_legend 8 pwndbg_control 2 } 1 pwndbg_regs 6 pwndbg_stack 6 } 3 } 7 pwndbg_disasm 3 } 3 { pwndbg_backtrace 1 pwndbg_threads 1 pwndbg_expressions 2 } 1 } 1 status 1

layout pwndbg

focus cmd
