using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class ReservationSystem
    {
        private List<User> usersInReservation;
        private static ReservationSystem instance;
        private DataConnection connection;

        protected ReservationSystem()
        {
            usersInReservation = new List<User>();
            connection = DataConnection.GetInstance();
        }

        public static ReservationSystem GetInstance()
        {
            if(instance == null)
            {
                instance = new ReservationSystem();
            }
            return instance;
        }

        public List<User> ReturnList()
        {
            return usersInReservation;
        }

        public void NewUser()
        {
            //parameters betalen en nog toevoegen aan database
        }

        public void NewReservation()
        {

        }

        public void AddUserToReservation(User user)
        {
            usersInReservation.Add(user);
        }

        public int RemoveUserFromReservation(int index)
        {
            int isMainbooker = 0;
            User u = usersInReservation[index];

            MainBooker m = u as MainBooker;
            if(m != null)
            {
                usersInReservation.Remove(m);
                isMainbooker = 1;
            }
            else
            {
                usersInReservation.Remove(u);
            }
            return isMainbooker;
        }

        public void ConfirmReservation()
        {

        }

        public List<Item_Edition> GetAllItemEditions()
        {
            List<Item> allItems = connection.GetAllItems();
            List<Item_Edition> allItemEditions = connection.GetAllItemEditions();

            for (int i = 0; i < allItemEditions.Count; i++)
            {
                foreach(Item it in allItems)
                {
                    if(it.ID == allItemEditions[i].ItemID)
                    {
                        allItemEditions[i].Name = it.Brand + " " + it.Series;
                    }
                }
            }
            return allItemEditions;
        }

        public List<Spot> GetFreeSpots()
        {
            List<Spot> freeSpots = connection.GetFreeSpots();
            List<Specification> allSpecs = connection.GetSpecifications();

            for (int i = 0; i < allSpecs.Count; i++)
            {
                foreach(Spot s in freeSpots)
                {
                    if (s.Number == allSpecs[i].SpotNumber)
                    {
                        if (allSpecs[i].SpecID == 2)
                        {
                            s.Special = "Comfort";
                        }
                        else if (allSpecs[i].SpecID == 3)
                        {
                            s.Special = "Handicap";
                        }
                        else if (allSpecs[i].SpecID == 4)
                        {
                            s.Size = Convert.ToInt32(allSpecs[i].SpecValue);
                        }
                        else if (allSpecs[i].SpecID == 5)
                        {
                            s.WaterAccess = allSpecs[i].SpecValue;
                        }
                    }
                }

            }
            return freeSpots;
        }
    }
}