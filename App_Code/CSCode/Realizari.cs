
using System;

namespace OlimpiasKnitting.Client.Entities
{
    public class Realizari
    {
        private int _id;    ///< The identifier
        private int _idAngajat; ///< The identifier angajat
        private int _idMasina;  ///< The identifier masina
        private int _idComanda; ///< The identifier comanda
        private int _idOperatie;    ///< The identifier operatie
        private DateTime _creat;    ///< The creat Date/Time
        private int _cantitate; ///< The cantitate
        private DateTime? _lastWrite;   ///< The last write
        private bool _inchis;    ///< The inchis
        private DateTime? _firstWrite;  ///< The first write
        private DateTime? _closed;  ///< The closed
        private bool? _pasiv;   ///< The pasiv
        private long? _idScanare;   ///< The identifier scanare
        private long? _nextJobId;   ///< Identifier for the next job

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

        public int IdAngajat
        {
            get
            {
                return _idAngajat;
            }

            set
            {
                if (_idAngajat != value)
                {
                    _idAngajat = value;
                }
            }
        }

        public int IdMasina
        {
            get
            {
                return _idMasina;
            }

            set
            {
                if (_idMasina != value)
                {
                    _idMasina = value;
                }
            }
        }

        public int IdComanda
        {
            get
            {
                return _idComanda;
            }

            set
            {
                if (_idComanda != value)
                {
                    _idComanda = value;
                }
            }
        }

        public int IdOperatie
        {
            get
            {
                return _idOperatie;
            }

            set
            {
                if (_idOperatie != value)
                {
                    _idOperatie = value;
                }
            }
        }

        public DateTime Creat
        {
            get
            {
                return _creat;
            }

            set
            {
                if (_creat != value)
                {
                    _creat = value;
                }
            }
        }

        public int Cantitate
        {
            get
            {
                return _cantitate;
            }

            set
            {
                if (_cantitate != value)
                {
                    _cantitate = value;
                }
            }
        }

        public DateTime? LastWrite
        {
            get
            {
                return _lastWrite;
            }

            set
            {
                if (_lastWrite != value)
                {
                    _lastWrite = value;
                }
            }
        }

        public bool Inchis
        {
            get
            {
                return _inchis;
            }

            set
            {
                if (_inchis != value)
                {
                    _inchis = value;
                }
            }
        }

        public DateTime? FirstWrite
        {
            get
            {
                return _firstWrite;
            }

            set
            {
                if (_firstWrite != value)
                {
                    _firstWrite = value;
                }
            }
        }

        public DateTime? Closed
        {
            get
            {
                return _closed;
            }

            set
            {
                if (_closed != value)
                {
                    _closed = value;
                }
            }
        }

        public bool? Pasiv
        {
            get
            {
                return _pasiv;
            }

            set
            {
                if (_pasiv != value)
                {
                    _pasiv = value;
                }
            }
        }

        public long? IdScanare
        {
            get
            {
                return _idScanare;
            }

            set
            {
                if (_idScanare != value)
                {
                    _idScanare = value;
                }
            }
        }

        public long? NextJobId
        {
            get
            {
                return _nextJobId;
            }

            set
            {
                if (_nextJobId != value)
                {
                    _nextJobId = value;
                }
            }
        }
    }
}