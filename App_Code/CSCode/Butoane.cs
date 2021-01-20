
using System;

namespace OlimpiasKnitting.Client.Entities
{
    public class Butoane 
    {
        private long _id;   ///< The identifier
        private int _adresa;    ///< The adresa
        private bool _buton;    ///< True to buton
        private DateTime _data; ///< The data
        private int _idRealizare;   ///< The identifier realizare
        private int? _idDifetto;    ///< The identifier difetto

        public long Id
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

        public int Adresa
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

        public bool Buton
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

        public DateTime Data
        {
            get
            {
                return _data;
            }

            set
            {
                if (_data != value)
                {
                    _data = value;
                }
            }
        }

        ///-------------------------------------------------------------------------------------------------
        /// <summary>Gets or sets the identifier realizare.</summary>
        ///
        /// <value>The identifier realizare.</value>
        ///-------------------------------------------------------------------------------------------------

        public int IdRealizare
        {
            get
            {
                return _idRealizare;
            }

            set
            {
                if (_idRealizare != value)
                {
                    _idRealizare = value;
                }
            }
        }
        public int? IdDifetto
        {
            get
            {
                return _idDifetto;
            }

            set
            {
                if (_idDifetto != value)
                {
                    _idDifetto = value;
                }
            }
        }
    }
}