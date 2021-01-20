
using System;

namespace OlimpiasKnitting.Client.Entities
{
    public class Comenzi
    {
        private int _id;    ///< The identifier
        private string _nrComanda;  ///< The nr comanda
        private int _idClient;  ///< The identifier client
        private int _idArticol; ///< The identifier articol
        private DateTime _dataLansare;  ///< The data lansare Date/Time
        private DateTime? _dataLivrare; ///< The data livrare
        private int _cantitate; ///< The cantitate
        private int _idStare;   ///< The identifier stare
        private DateTime _dVC;  ///< The vc Date/Time
        private int _idSector;  ///< The identifier sector
        private bool _active;   ///< True to active
        private int? _carico;   ///< The carico
        private int? _diffT;    ///< The difference t
        private string _line;   ///< The line
        private double? _minuti;    ///< The minuti
        private int? _giorniLavorati;   ///< The giorni lavorati
        private string _tessitura;  ///< The tessitura
        private string _confezione; ///< The confezione
        private string _respinte;   ///< The respinte
        private string _note;   ///< The note
        private int? _consegnato;   ///< The consegnato
        private int? _diffC;    ///< The difference c
        private string _department; ///< The department
        private DateTime? _dataProduzione;  ///< The data produzione
        private DateTime? _rdd; ///< The rdd
        private DateTime? _dataFine;    ///< The data fine
        private int _counter;   ///< The counter
        private bool? _caricoTrigger;   ///< The carico trigger
        private bool _isDeleted;    ///< True if is deleted, false if not

        public bool? CaricoTrigger
        {
            get { return _caricoTrigger; }
            set
            {
                _caricoTrigger = value;
            }
        }

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

        public string NrComanda
        {
            get
            {
                return _nrComanda;
            }

            set
            {
                if (_nrComanda != value)
                {
                    _nrComanda = value;
                }
            }
        }

        public int IdClient
        {
            get
            {
                return _idClient;
            }

            set
            {
                if (_idClient != value)
                {
                    _idClient = value;
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

        public DateTime DataLansare
        {
            get
            {
                return _dataLansare;
            }

            set
            {
                if (_dataLansare != value)
                {
                    _dataLansare = value;
                }
            }
        }

        public DateTime? DataLivrare
        {
            get
            {
                return _dataLivrare;
            }

            set
            {
                if (_dataLivrare != value)
                {
                    _dataLivrare = value;
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

        public int IdStare
        {
            get
            {
                return _idStare;
            }

            set
            {
                _idStare = value;
            }
        }

        public DateTime DVC
        {
            get
            {
                return _dVC;
            }

            set
            {
                if (_dVC != value)
                {
                    _dVC = value;
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

        public int? Carico
        {
            get
            {
                return _carico;
            }

            set
            {
                if (_carico != value)
                {
                    _carico = value;
                }
            }
        }

        public int? Diff_t
        {
            get
            {
                return _diffT;
            }

            set
            {
                if (_diffT != value)
                {
                    _diffT = value;
                }
            }
        }

        public string Line
        {
            get
            {
                return _line;
            }

            set
            {
                if (_line != value)
                {
                    _line = value;
                }
            }
        }

        public double? Minuti
        {
            get
            {
                return _minuti;
            }

            set
            {
                if (_minuti != value)
                {
                    _minuti = value;
                }
            }
        }

        public int? GiorniLavorati
        {
            get
            {
                return _giorniLavorati;
            }

            set
            {
                if (_giorniLavorati != value)
                {
                    _giorniLavorati = value;
                }
            }
        }

        public string Tessitura
        {
            get
            {
                return _tessitura;
            }

            set
            {
                if (_tessitura != value)
                {
                    _tessitura = value;
                }
            }
        }

        public string Confezione
        {
            get
            {
                return _confezione;
            }

            set
            {
                if (_confezione != value)
                {
                    _confezione = value;
                }
            }
        }

        public string Respinte
        {
            get
            {
                return _respinte;
            }

            set
            {
                if (_respinte != value)
                {
                    _respinte = value;
                }
            }
        }

        public string Note
        {
            get
            {
                return _note;
            }

            set
            {
                if (_note != value)
                {
                    _note = value;
                }
            }
        }

        public int? Consegnato
        {
            get
            {
                return _consegnato;
            }

            set
            {
                if (_consegnato != value)
                {
                    _consegnato = value;
                }
            }
        }

        public int? Diff_c
        {
            get
            {
                return _diffC;
            }

            set
            {
                if (_diffC != value)
                {
                    _diffC = value;
                }
            }
        }

        public string Department
        {
            get
            {
                return _department;
            }

            set
            {
                if (_department != value)
                {
                    _department = value;
                }
            }
        }

        public DateTime? DataProduzione
        {
            get
            {
                return _dataProduzione;
            }

            set
            {
                if (_dataProduzione != value)
                {
                    _dataProduzione = value;
                }
            }
        }

        public DateTime? RDD
        {
            get
            {
                return _rdd;
            }

            set
            {
                if (_rdd != value)
                {
                    _rdd = value;
                }
            }
        }

        public DateTime? DataFine
        {
            get
            {
                return _dataFine;
            }

            set
            {
                if (_dataFine != value)
                {
                    _dataFine = value;
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
                if (_isDeleted != value)
                {
                    _isDeleted = value;
                }
            }
        }

    }
}