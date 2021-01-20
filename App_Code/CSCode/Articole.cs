
namespace OlimpiasKnitting.Client.Entities
{
    public class Articole 
    {
        private int _id;    ///< The identifier
        private string _articol;    ///< The articol
        private string _descriere;  ///< The descriere
        private double? _costProductie; ///< The cost productie
        private int? _idStagiune;   ///< The identifier stagiune
        private string _finete; ///< The finete
        private double? _prezzo;    ///< The prezzo
        private int _idSector;  ///< The identifier sector
        private double? _centes;    ///< The centes
        private string _stagione;   ///< The stagione
        private double? _centesimiSum;  ///< The centesimi sum
        private double? _clientCentesimiSum;    ///< The client centesimi sum
        private int _counter;   ///< The counter
        private string _note;   ///< The note
        private byte[] _pdfView;
        private int _idTaglie;
        private double? _prezzoCliente;
        private bool _isDeleted;

        ///-------------------------------------------------------------------------------------------------
        /// <summary>Gets or sets the counter.</summary>
        ///
        /// <value>The counter.</value>
        ///-------------------------------------------------------------------------------------------------

        public int Counter
        {
            get { return _counter; }
            set
            {
                if (_counter != value)
                {
                    _counter = value;
                }
            }
        }

        ///-------------------------------------------------------------------------------------------------
        /// <summary>Gets or sets the client centesimi sum.</summary>
        ///
        /// <value>The client centesimi sum.</value>
        ///-------------------------------------------------------------------------------------------------

        public double? ClientCentesimiSum
        {
            get { return _clientCentesimiSum; }
            set
            {
                if (_clientCentesimiSum != value)
                {
                    _clientCentesimiSum = value;
                }
            }
        }

        ///-------------------------------------------------------------------------------------------------
        /// <summary>Gets or sets the centesimi sum.</summary>
        ///
        /// <value>The centesimi sum.</value>
        ///-------------------------------------------------------------------------------------------------

        public double? CentesimiSum
        {
            get { return _centesimiSum; }
            set
            {
                if (_centesimiSum != value)
                {
                    _centesimiSum = value;
                }
            }
        }
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

        public string Articol
        {
            get
            {
                return _articol;
            }

            set
            {
                if (_articol != value)
                {
                    _articol = value;
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

        ///-------------------------------------------------------------------------------------------------
        /// <summary>Gets or sets the cost productie.</summary>
        ///
        /// <value>The cost productie.</value>
        ///-------------------------------------------------------------------------------------------------

        public double? CostProductie
        {
            get
            {
                return _costProductie;
            }

            set
            {
                if (_costProductie != value)
                {
                    _costProductie = value;
                }
            }
        }

        ///-------------------------------------------------------------------------------------------------
        /// <summary>Gets or sets the identifier stagiune.</summary>
        ///
        /// <value>The identifier stagiune.</value>
        ///-------------------------------------------------------------------------------------------------

        public int? IdStagiune
        {
            get
            {
                return _idStagiune;
            }

            set
            {
                if (_idStagiune != value)
                {
                    _idStagiune = value;
                }
            }
        }

        public string Finete
        {
            get
            {
                return _finete;
            }

            set
            {
                if (_finete != value)
                {
                    _finete = value;
                }
            }
        }

        public double? Prezzo
        {
            get
            {
                return _prezzo;
            }

            set
            {
                if (_prezzo != value)
                {
                    _prezzo = value;
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

        ///-------------------------------------------------------------------------------------------------
        /// <summary>Gets or sets the stagione.</summary>
        ///
        /// <value>The stagione.</value>
        ///-------------------------------------------------------------------------------------------------

        public string Stagione
        {
            get
            {
                return _stagione;
            }

            set
            {
                if (_stagione != value)
                {
                    _stagione = value;
                }
            }
        }

        ///-------------------------------------------------------------------------------------------------
        /// <summary>Gets or sets the note.</summary>
        ///
        /// <value>The note.</value>
        ///-------------------------------------------------------------------------------------------------

        public string Note
        {
            get { return _note; }
            set
            {
                if (_note != value)
                {
                    _note = value;
                }
            }
        }

        public byte[] PdfView
        {
            get { return _pdfView; }
            set
            {
                if (_pdfView != value)
                {
                    _pdfView = value;
                }
            }
        }

        public int IdTaglie
        {
            get
            {
                return _idTaglie;
            }

            set
            {
                if (_idTaglie != value)
                {
                    _idTaglie = value;
                }
            }

        }

        public double? PrezzoCliente
        {
            get
            {
                return _prezzoCliente;
            }

            set
            {
                if (_prezzoCliente != value)
                {
                    _prezzoCliente = value;
                }
            }

        }

        public bool IsDeleted
        {
            get
            {
                return _isDeleted;
            }

            set
            {
                _isDeleted = value;
            }
        }

    }
}