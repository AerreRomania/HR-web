
using System;
using System.Text.RegularExpressions;

namespace OlimpiasKnitting.Client.Entities
{
    public class Masini 
    {
        private int _id;    ///< The identifier
        private string _codMasina;  ///< The cod masina
        private string _descriere;  ///< The descriere
        private string _linie;  ///< The linie
        private int? _adresa;   ///< The adresa
        private bool? _buton;   ///< The buton
        private int? _realizare;    ///< The realizare
        private int? _bucatiButon;  ///< The bucati buton
        private int? _grup; ///< The grup
        private int _idSector;  ///< The identifier sector
        private int? _adresaRotto;  ///< The adresa rotto
        private bool _active;   ///< True to active
        private string _matricola;  ///< The matricola
        private DateTime? _dataAcquisto;    ///< The data acquisto
        private string _description;    ///< The description
        private string _squadra;   ///< The squadra
        private string _confection;
        private string _groups;
        private int _position;

        public int Id
        {
            get
            {
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

        public string CodMasina
        {
            get
            {
                return _codMasina;
            }

            set
            {
                if (_codMasina != value)
                {
                    _codMasina = value;
                }
            }
        }

        public string Descriere
        {
            get
            {
                return _descriere;
            }

            set
            {
                if (_descriere != value)
                {
                    _descriere = value;
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

        public int? Adresa
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

        public bool? Buton
        {
            get
            {
                return _buton;
            }

            set
            {
                if (_buton != value)
                {
                    _buton = value;
                }
            }
        }

        public int? Realizare
        {
            get
            {
                return _realizare;
            }

            set
            {
                if (_realizare != value)
                {
                    _realizare = value;
                }
            }
        }

        public int? BucatiButon
        {
            get
            {
                return _bucatiButon;
            }

            set
            {
                if (_bucatiButon != value)
                {
                    _bucatiButon = value;
                }
            }
        }

        public int? Grup
        {
            get
            {
                return _grup;
            }

            set
            {
                if (_grup != value)
                {
                    _grup = value;
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

        public int? AdresaRotto
        {
            get
            {
                return _adresaRotto;
            }

            set
            {
                if (_adresaRotto != value)
                {
                    _adresaRotto = value;
                }
            }
        }
        public bool Active
        {
            get
            {
                return _active;
            }

            set
            {
                if (_active != value)
                {
                    _active = value;
                }
            }
        }

        public string Matricola
        {
            get
            {
                return _matricola;
            }

            set
            {
                if (_matricola != value)
                {
                    _matricola = value;
                }
            }
        }

        public DateTime? DataAcquisto
        {
            get
            {
                return _dataAcquisto;
            }

            set
            {
                if (_dataAcquisto != value)
                {
                    _dataAcquisto = value;
                }
            }
        }

        public string Description
        {
            get
            {
                return _description;
            }

            set
            {
                if (_description != value)
                {
                    _description = value;
                }
            }
        }
        public string Squadra
        {
            get
            {
                return _squadra;
            }

            set
            {
                if (_squadra != value)
                {
                    _squadra = value;
                }
            }
        }

        public string Confection
        {
            get
            {
                return _confection;
            }

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
            get
            {
                return _groups;
            }

            set
            {
                if (_groups != value)
                {
                    _groups = value;
                }
            }
        }

        public int Position
        {
            get
            {
                return _position;
            }

            set
            {
                if (_position != value)
                {
                    _position = value;
                }
            }
        }

    }
}