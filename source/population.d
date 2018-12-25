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

class Population {
    Individual[] individuals;
    real fittest = 0;

    this(int size)
    {
        for (auto i = 0; i < size; i++) {
            individuals ~= new Individual();
        }
        calculateFitness();
    }

    auto getRandom()
    {
      return individuals.choice();
    }

    auto getFittest()
    {
        return individuals[$-1];
    }

    auto getSecondFittest()
    {
        return individuals[$-2];
    }

    auto getLeastFittestIndex()
    {
        return 0;
    }

    auto calculateFitness()
    {
        foreach (i, ref individual; parallel(individuals)) {
            individual.calcFitness();
        }
        sort(individuals);
    }

}
