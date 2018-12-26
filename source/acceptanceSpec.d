import bfvm;
import fut;
import params;

auto run(string program, bool silent = false)
{
  auto vm = new BFVM();
  if (!silent)
  {
    vm.toggleSilence();
  }
  auto tester = new Unit();
  try
  {
    vm.reset();
    vm.load(program);
    vm.run(MAX_CYCLES, ["./someexe","hard times, gonna make you wonder why you even try"]);
    tester.score(vm.dumpOutput(), "hard times, gonna make you wonder why you even try\n");
    vm.reset();
    vm.run(MAX_CYCLES, ["meirl","Dank"]);
    tester.score(vm.dumpOutput(), "Dank\n");
    vm.reset();
    vm.run(MAX_CYCLES, ["lmaotbh","we"]);
    tester.score(vm.dumpOutput(), "we\n");
    vm.reset();
    vm.run(MAX_CYCLES, ["lmaotbqhfamalam","i"]);
    tester.score(vm.dumpOutput(), "i\n");
    vm.reset();
    vm.run(MAX_CYCLES, ["a","."]);
    tester.score(vm.dumpOutput(), ".\n");
    return tester.fitness();
  }
  catch(InvalidProgram e)
  {
    return -1;
  }
}
