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

class Individual {
    real fitness = 0;
    string[] chromosome;

  	this()
    {
        //Set chromosome randomly for each new individual
        for (int i=0; i<CHROMOSOME_LENGTH; i++)
        {
						chromosome ~= ["[","]","+","-",".",">","<",""].choice();
        }
        fitness = 0;
    }

    auto crossover(ref Individual other)
    {
      int crossOverPoint = uniform(0, cast(int) chromosome.length);

      auto temp = chromosome.dup;
      chromosome = chromosome[0..crossOverPoint] ~ other.chromosome[crossOverPoint..$];
      other.chromosome = other.chromosome[0..crossOverPoint] ~ temp[crossOverPoint..$];
    }

    auto mutate()
    {
      chromosome[uniform(0, chromosome.length)] = ["[","]","+","-",".",">","<",""].choice();
    }

    int opCmp(ref const Individual other)
    {
      if (fitness > other.fitness)
      {
          return +1;
      }
      if (fitness < other.fitness)
      {
          return -1;
      }
      return 0;
    }

    auto isPerfect()
    {
      return fitness == 1;
    }

    auto getProgram()
    {
      return join(chromosome);
    }

    auto calcFitness()
    {
      fitness = acceptanceSpec.run(getProgram());
    }
}
