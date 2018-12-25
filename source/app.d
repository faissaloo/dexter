import std.stdio;
import std.random;
import std.math;
import std.array;
import std.algorithm;
import std.conv;
import std.parallelism;
import acceptanceSpec;
import evolver;
import population;
import individual;
import params;

void main(string[] args)
{
  Evolver evo = new Evolver(POPULATION_SIZE);

  writeln("Generation: ", evo.generationCount, " Fittest: ", evo.population.getFittest().fitness, " Program: ", join(evo.population.getFittest().chromosome));

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

      writeln("Generation: ", evo.generationCount, " Fittest: ", evo.population.getFittest().fitness, " Program: ", join(evo.population.getFittest().chromosome));
  }

  writeln("\nSolution found in generation ", evo.generationCount);
  writeln("Fitness: ", evo.population.getFittest().fitness);
  writeln("chromosome: ");
  writeln(evo.population.getFittest().getProgram());
}
