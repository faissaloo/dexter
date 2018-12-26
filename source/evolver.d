import std.algorithm;
import population;
import individual;
import params;

class Evolver
{
    Population population;
    Individual fittest;
    Individual secondFittest;
    int generationCount = 0;

    this(int size)
    {
      population = new Population(size);
    }

    auto selection()
    {
        auto prev_fittest = population.getFittest();
        auto prev_secondFittest = population.getSecondFittest();

        fittest = new Individual();
        fittest.chromosome = prev_fittest.chromosome;

        secondFittest = new Individual();
        secondFittest.chromosome = prev_secondFittest.chromosome;
    }

    auto crossover()
    {
        fittest.crossover(secondFittest);
    }

    auto mutation()
    {
        population.getRandom().mutate();
    }

    auto getFittestOffspring()
    {
        return max(fittest, secondFittest);
    }


    //Replace least fittest individual from most fittest offspring
    auto addFittestOffspring()
    {
        //Update fitness values of offspring
        fittest.calcFitness();
        secondFittest.calcFitness();

        //Replace least fittest individual with the fittest offspring
        population.individuals[0] = getFittestOffspring();
    }
}
