import bfvm;
import fut;
import params;

auto run(string program)
{
  auto vm = new BFVM();
  vm.toggleSilence();
  auto tester = new Unit();
  try
  {
    vm.reset();
    vm.load(program);
    vm.run(MAX_CYCLES);
    tester.score!(ubyte)(vm.dumpMemory()[0], 50);
    return tester.fitness();
  }
  catch(InvalidProgram e)
  {
    return -1;
  }
}
