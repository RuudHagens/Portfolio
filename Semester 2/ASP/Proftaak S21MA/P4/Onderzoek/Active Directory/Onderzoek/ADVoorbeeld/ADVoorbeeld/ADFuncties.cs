using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.DirectoryServices;
using System.DirectoryServices.ActiveDirectory;

namespace ADVoorbeeld
{
    public class ADFuncties
    {
        string domainIp = "192.168.20.146";
        public bool Authenticate(string userName, string password)
        {
            bool authentic = false;
            try
            {
                DirectoryEntry entry = new DirectoryEntry("LDAP://" + domainIp,
                    userName, password);
                object nativeObject = entry.NativeObject;
                authentic = true;
            }
            catch (DirectoryServicesCOMException ex) { System.Windows.Forms.MessageBox.Show(ex.Message); }
            return authentic;
        }

        public List<string> GetADUserInfo(string userName)
        {
            List<string> info = new List<string>();
            try
            {
                //This is a generic LDAP call, it would do a DNS lookup to find a DC in your AD site, scales better
                DirectoryEntry enTry = new DirectoryEntry("LDAP://" + domainIp, "admin", "Welkom01");

                DirectorySearcher mySearcher = new DirectorySearcher(enTry);
                mySearcher.Filter = "(&(objectClass=user)(anr=" + userName + "))";
                try
                {
                    foreach (SearchResult sResultSet in mySearcher.FindAll())
                    {
                        // Login Name
                        info.Add(GetProperty(sResultSet, "cn"));
                        // First Name
                        info.Add(GetProperty(sResultSet, "givenName"));
                        // Middle Initials
                        info.Add(GetProperty(sResultSet, "initials"));
                        // Last Name
                        info.Add(GetProperty(sResultSet, "sn"));
                        // Address
                        info.Add(GetProperty(sResultSet, "homePostalAddress"));
                        // title
                        info.Add(GetProperty(sResultSet, "title"));
                        // company
                        info.Add(GetProperty(sResultSet, "company"));
                        //state
                        info.Add(GetProperty(sResultSet, "st"));
                        //city
                        info.Add(GetProperty(sResultSet, "l"));
                        //country
                        info.Add(GetProperty(sResultSet, "co"));
                        //postal code
                        info.Add(GetProperty(sResultSet, "postalCode"));
                        // telephonenumber
                        info.Add(GetProperty(sResultSet, "telephoneNumber"));
                        //extention
                        info.Add(GetProperty(sResultSet, "otherTelephone"));
                        //fax
                        info.Add(GetProperty(sResultSet, "facsimileTelephoneNumber"));
                        // email address
                        info.Add(GetProperty(sResultSet, "mail"));
                        // Challenge Question
                        info.Add(GetProperty(sResultSet, "extensionAttribute1"));
                        // Challenge Response
                        info.Add(GetProperty(sResultSet, "extensionAttribute2"));
                        // Member Company
                        info.Add(GetProperty(sResultSet, "extensionAttribute3"));
                        // Company Relation ship Exits
                        info.Add(GetProperty(sResultSet, "extensionAttribute4"));
                        // status
                        info.Add(GetProperty(sResultSet, "extensionAttribute5"));
                        // Assigned Sales Person
                        info.Add(GetProperty(sResultSet, "extensionAttribute6"));
                        // Accept T and C
                        info.Add(GetProperty(sResultSet, "extensionAttribute7"));
                        // jobs
                        info.Add(GetProperty(sResultSet, "extensionAttribute8"));
                        // email over night
                        info.Add(GetProperty(sResultSet, "extensionAttribute9"));
                        // email daily emerging market
                        info.Add(GetProperty(sResultSet, "extensionAttribute10"));
                        // email daily corporate market
                        info.Add(GetProperty(sResultSet, "extensionAttribute11"));
                        // AssetMgt Range
                        info.Add(GetProperty(sResultSet, "extensionAttribute12"));
                        // date of account created
                        info.Add(GetProperty(sResultSet, "whenCreated"));
                        // date of account changed
                        info.Add(GetProperty(sResultSet, "whenChanged"));

                        info.Add(GetProperty(sResultSet, "memberOf"));



                        info.Add(GetProperty(sResultSet, "CN"));

                        info.Add(string.Empty);
                    }
                }
                catch (Exception f)
                {
                    System.Windows.Forms.MessageBox.Show(f.Message);
                }
            }
            catch (Exception f)
            {
                System.Windows.Forms.MessageBox.Show(f.Message);
            }
            return info;
        }

        public bool AddUserToGroup(string userDn, string groupDn)
        {
            bool gelukt = false;

            try
            {
                DirectoryEntry dirEntry = new DirectoryEntry("LDAP://" + domainIp + "/" + groupDn);//TODO Check of werkt
                dirEntry.Properties["member"].Add(userDn);
                dirEntry.CommitChanges();
                dirEntry.Close();
                gelukt = true;
            }
            catch (System.DirectoryServices.DirectoryServicesCOMException ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

            return gelukt;
        }

        public bool CreateUserAccount(string userName, string userPassword)
        {//werkt niet, een probleem met authenticatie?
            bool gelukt = false;
            try
            {
                DirectoryEntry dirEntry = new DirectoryEntry("LDAP://" + domainIp,"administrator","Welkom01");
                DirectoryEntry newUser = dirEntry.Children.Add("CN=" + userName, "user");
                newUser.Properties["samAccountName"].Value = userName;
                newUser.CommitChanges();

                newUser.Invoke("SetPassword", new object[] { userPassword });
                newUser.CommitChanges();
                dirEntry.Close();
                newUser.Close();

                gelukt = true;
            }
            catch (System.DirectoryServices.DirectoryServicesCOMException ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);

            }
            return gelukt;
        }

        public static string GetProperty(SearchResult searchResult, string PropertyName)
        {
            if (searchResult.Properties.Contains(PropertyName))
            {
                return searchResult.Properties[PropertyName][0].ToString();
            }
            else
            {
                return PropertyName + ": ";
            }
        }

        public string GetUserInfo(string userName)
        {
            string info = "";
            try
            {
                //This is a generic LDAP call, it would do a DNS lookup to find a DC in your AD site, scales better
                DirectoryEntry enTry = new DirectoryEntry("LDAP://" + domainIp, "admin", "Welkom01");

                DirectorySearcher mySearcher = new DirectorySearcher(enTry);
                mySearcher.Filter = "(&(objectClass=user)(anr=" + userName + "))";
                try
                {
                    
                    foreach (SearchResult sResultSet in mySearcher.FindAll())
                    {
                        info = GetProperty(sResultSet, "memberOf");

                        if (info.Contains("TVS"))
                        {
                            
                            string info1 = info.Remove(0, 7);
                            info = info1;
                            int index = info1.IndexOf(",OU");
                            info = info1.Remove(index);
                        }
                        
                    }
                }
                catch (Exception f)
                {
                    System.Windows.Forms.MessageBox.Show(f.Message);
                }
            }
            catch (Exception f)
            {
                System.Windows.Forms.MessageBox.Show(f.Message);
            }
            return info;
        }

        public string HaalEmailOp(string naamMedewerker)
        {
            string info = "";
            try
            {
                //This is a generic LDAP call, it would do a DNS lookup to find a DC in your AD site, scales better
                DirectoryEntry enTry = new DirectoryEntry("LDAP://" + domainIp, "admin", "Welkom01");

                DirectorySearcher mySearcher = new DirectorySearcher(enTry);
                mySearcher.Filter = "(&(objectClass=user)(anr=" + naamMedewerker + "))";
                try
                {
                    foreach (SearchResult sResultSet in mySearcher.FindAll())
                    {
                        info = GetProperty(sResultSet, "mail");
                    }
                }
                catch (Exception f)
                {
                    //
                }
            }
            catch (Exception f)
            {
                //
            }
            return info;
        }
    }
}
