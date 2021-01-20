
using System;

namespace OlimpiasKnitting.Client.Entities
{
    public class Angajati
    {
        private int _id;    ///< The identifier
        private string _codAngajat; ///< The cod angajat
        private string _angajat;    ///< The angajat
        private string _sex;    ///< The sex
        private DateTime _dataNasterii = DateTime.Now; ///< The data nasterii Date/Time
        private string _telefon;    ///< The telefon
        private string _adresa; ///< The adresa
        private DateTime _dataAngajarii = DateTime.Now;    ///< The data angajarii Date/Time
        private bool _status;   ///< True to status
        private string _linie;  ///< The linie
        private int _idSector;  ///< The identifier sector
        //private int _counter;   ///< The counter
        private bool _active;   ///< True to active
        private string _mansione;
        private string _confection;
        private string _groups;

        public bool Active 
        {
            get { return _active; }
            set 
            {
                if (_active != value)
                {
                    _active = value;
                }
            } 
        }

        //public int Counter
        //{
        //    get { return _counter; }
        //    set
        //    {
        //        if (_counter != value)
        //        {
        //            _counter = value;
        //        }
        //    }
        //}

        public int Id
        {
            get {
                return _id;
            }
            set
            {
                if (_id != value)
                {
                    _id = value;
                }
            }
        }

        public string CodAngajat
        {
            get
            {
                return _codAngajat;
            }
            set
            {
                if (_codAngajat != value)
                {
                    _codAngajat = value;
                }
            }
        }

        public string Angajat
        {
            get
            {
                return _angajat;
            }

            set
            {
                if (_angajat != value)
                {
                    _angajat = value;
                }
            }
        }

        public string Sex
        {
            get
            {
                return _sex;
            }

            set
            {
                if (_sex != value)
                {
                    _sex = value;
                }
            }
        }

        public DateTime DataNasterii
        {
            get
            {
                return _dataNasterii;
            }

            set
            {
                if (_dataNasterii != value)
                {
                    _dataNasterii = value;
                }
            }
        }

        public string Telefon
        {
            get
            {
                return _telefon;
            }

            set
            {
                if (_telefon != value)
                {
                    _telefon = value;
                }
            }
        }

        public string Adresa
        {
            get
            {
                return _adresa;
            }

            set
            {
                if (_adresa != value)
                {
                    _adresa = value;
                }
            }
        }

        public DateTime DataAngajarii
        {
            get
            {
                return _dataAngajarii;
            }

            set
            {
                if (_dataAngajarii != value)
                {
                    _dataAngajarii = value;
                }
            }
        }

        public bool status
        {
            get
            {
                return _status;
            }

            set
            {
                if (_status != value)
                {
                    _status = value;
                }
            }
        }

        public string Linie
        {
            get
            {
                return _linie;
            }

            set
            {
                if (_linie != value)
                {
                    _linie = value;
                }
            }
        }

        public int IdSector
        {
            get
            {
                return _idSector;
            }

            set
            {
                if (_idSector != value)
                {
                    _idSector = value;
                }
            }
        }

        public string Mansione
        {
            get { return _mansione; }
            set
            {
                if (_mansione != value)
                {
                    _mansione = value;
                }
            }
        }

        public string Confection
        {
            get { return _confection; }
            set
            {
                if (_confection != value)
                {
                    _confection = value;
                }
            }
        }

        public string Groups
        {
            get { return _groups; }
            set
            {
                if (_groups != value)
                {
                    _groups = value;
                }
            }
        }

    }
}