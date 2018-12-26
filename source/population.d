import std.random;
import std.algorithm;
import std.parallelism;
import individual;

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
