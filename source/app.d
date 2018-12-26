import std.stdio;
import evolver;
import params;
import acceptanceSpec;

void main(string[] args)
{
  Evolver evo = new Evolver(POPULATION_SIZE);

  writeln("Generation: ", evo.generationCount, " Fittest: ", evo.population.getFittest().fitness, " Program: ", evo.population.getFittest().getProgram());

  while (!evo.population.getFittest().isPerfect())
  {
      ++evo.generationCount;

      evo.selection();
      evo.crossover();

      for (auto i=0; i<MUTATION_RATE; i++)
      {
        evo.mutation();
      }

      evo.addFittestOffspring();
      evo.population.calculateFitness();

      writeln("Generation: ", evo.generationCount, " Fittest: ", evo.population.getFittest().fitness, " Program: ", evo.population.getFittest().getProgram());
  }

  writeln("\nSolution found in generation ", evo.generationCount);
  writeln("Fitness: ", evo.population.getFittest().fitness);
  writeln("chromosome: ");

  writeln(evo.population.getFittest().getProgram());
  writeln("Final test:");
  run(evo.population.getFittest().getProgram(), true);
}
