

namespace OlimpiasKnitting.Client.Entities
{
    public class Operatii 
    {
        private int _id;    ///< The identifier
        private string _codOperatie;    ///< The cod operatie
        private string _operatie;   ///< The operatie
        private int _pozRaport; ///< The poz raport
        private bool _isPasiv;  ///< True if is pasiv, false if not
        private int _idSector;  ///< The identifier sector
        private double? _costoFase; ///< The costo fase
        private double? _prezzoFase;    ///< The prezzo fase
        private string _descrizione;    ///< The descrizione
        private int? _machineId;    ///< Identifier for the machine

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

        public string CodOperatie
        {
            get
            {
                return _codOperatie;
            }

            set
            {
                if (_codOperatie != value)
                {
                    _codOperatie = value;
                }
            }
        }

        public string Operatie
        {
            get
            {
                return _operatie;
            }

            set
            {
                if (_operatie != value)
                {
                    _operatie = value;
                }
            }
        }

        public int PozRaport
        {
            get
            {
                return _pozRaport;
            }

            set
            {
                if (_pozRaport != value)
                {
                    _pozRaport = value;
                }
            }
        }

        public bool IsPasiv
        {
            get
            {
                return _isPasiv;
            }

            set
            {
                if (_isPasiv != value)
                {
                    _isPasiv = value;
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

        public double? CostoFase
        {
            get
            {
                return _costoFase;
            }

            set
            {
                if (_costoFase != value)
                {
                    _costoFase = value;
                }
            }
        }

        public double? PrezzoFase
        {
            get
            {
                return _prezzoFase;
            }

            set
            {
                if (_prezzoFase != value)
                {
                    _prezzoFase = value;
                }
            }
        }

        public string Descrizione
        {
            get
            {
                return _descrizione;
            }

            set
            {
                if (_descrizione != value)
                {
                    _descrizione = value;
                }
            }
        }

        public int? MachineID
        {
            get { return _machineId; }
            set
            {
                if (_machineId != value)
                {
                    _machineId = value;
                }
            }
        }

    }
}