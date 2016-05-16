using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AnimalShelter
{
    class Administration
    {
        private List<Animal> animals;

        public Administration()
        {
            animals = new List<Animal>();
        }

        public List<Animal> Animals{get { return animals; }}

        public bool Add(Animal animal)
        {
            bool NotInList = true;
            foreach (Animal a in animals)
            {
                if (a.chipRegistrationNumber == animal.chipRegistrationNumber)
                {
                    NotInList = false;
                }
            }
                if (NotInList)
                {
                    animals.Add(animal);
                    return true;
                }
                return false;
        }

        public bool RemoveAnimal(string chipRegistrationNumber)
        {
            bool remove = true;
            foreach (Animal a in animals.ToList())
            {
                if (a.chipRegistrationNumber != chipRegistrationNumber)
                {
                    remove = false;
                }
                if (remove)
                {
                    animals.Remove(a);
                }
            }
            return true;
        }

        public Animal FindAnimal(string chipRegistrationNumber)
        {
            foreach (Animal a in animals)
            {
                if(a.chipRegistrationNumber == chipRegistrationNumber)
                {
                    return a;
                }
            }
            return null;
        }
    }
}
