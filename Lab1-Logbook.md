## Task 1
Create and modified all files and code based on instructions. What I noticed is that the top->eval() may not create aditional simulation if we are still inside the same cycle. After reviewing the verilator doc, the reason is because verilator only updates if there is a change in cycle, i.e. top->clk is changed. 

tfp->dump is for saving the waveform with cycle number.

I also notice that if I change the rst and en after the top-eval(), that will lead to a delay in one cycle, which is not what I expect. Putting those code before the inner loop will make the behaviour correct.