#include "Vcounter.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env) {
    int i;
    int clk;

    Verilated::commandArgs(argc, argv);
    // TODO: Check the doc about this

    Vcounter* top = new Vcounter;

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("counter.vcd");

    top->clk = 1;
    top->rst = 1;
    top->en = 0;

    for (i = 0; i < 300; i++) {
        top->rst = (i < 2) | (i == 15);
        top->en = (i > 4);
        // If I put it here, I can get the en at high at i=5, which is what I expect
        for (clk = 0; clk < 2; clk++) {
            tfp->dump(2*i+clk);
            top->clk = !top->clk;
            top->eval();
        }
        // top->rst = (i < 2) | (i == 15);
        // top->en = (i > 4);
        // top->eval();
        // If I put the eval here, it seems that this eval won't work.
        // As I can still get the same wavefont.
        if (Verilated::gotFinish()) exit(0);
    }
    tfp->close();
    exit(0);
}
