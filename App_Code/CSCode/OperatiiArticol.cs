
namespace OlimpiasKnitting.Client.Entities
{
    public class OperatiiArticol 
    {
        private int _id;    ///< The identifier
        private int _idArticol; ///< The identifier articol
        private int _idOperatie;    ///< The identifier operatie
        private double _bucatiOra;  ///< The bucati ora
        private int _bucatiButon;   ///< The bucati buton
        private int _ordine;    ///< The ordine
        private int _idGrupe;   ///< The identifier grupe
        private int _idSector;  ///< The identifier sector
        private bool? _extra;   ///< The extra
        private double? _centes;    ///< The centes
        public double? _clientNorm; ///< The client normalize
        public double? _clientNormCentesimi;    ///< The client normalize centesimi
        public string _component;
        public string _groupName;

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

        public int IdArticol
        {
            get
            {
                return _idArticol;
            }

            set
            {
                if (_idArticol != value)
                {
                    _idArticol = value;
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

        public double BucatiOra
        {
            get
            {
                return _bucatiOra;
            }

            set
            {
                if (_bucatiOra != value)
                {
                    _bucatiOra = value;
                }
            }
        }

        public int BucatiButon
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

        public int Ordine
        {
            get
            {
                return _ordine;
            }

            set
            {
                if (_ordine != value)
                {
                    _ordine = value;
                }
            }
        }
        public int IdGrupe
        {
            get
            {
                return _idGrupe;
            }

            set
            {
                if (_idGrupe != value)
                {
                    _idGrupe = value;
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

        public bool? Extra
        {
            get
            {
                return _extra;
            }

            set
            {
                if (_extra != value)
                {
                    _extra = value;
                }
            }
        }

        public double? Centes
        {
            get
            {
                return _centes;
            }

            set
            {
                if (_centes != value)
                {
                    _centes = value;
                }
            }
        }

        public double? ClientNorm
        {
            get
            {
                return _clientNorm;
            }

            set
            {
                if (_clientNorm != value)
                {
                    _clientNorm = value;
                }
            }
        }

        public double? ClientNormCentesimi
        {
            get
            {
                return _clientNormCentesimi;
            }

            set
            {
                if (_clientNormCentesimi != value)
                {
                    _clientNormCentesimi = value;
                }
            }
        }

        public string Component
        {
            get
            {
                return _component;
            }

            set
            {
                if (_component != value)
                {
                    _component = value;
                }
            }
        }

        public string GroupName
        {
            get
            {
                return _groupName;
            }

            set
            {
                if (_groupName != value)
                {
                    _groupName = value;
                }
            }
        }

    }
}