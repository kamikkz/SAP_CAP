// types para schema02
namespace capLearning.schema02.types;

using {
    Country,
    Language,
    Currency,
    Timezone
} from '@sap/cds/common';

type country  : Country;
type language : Language;
type currency : Currency;
type timezone : Timezone;
type phoneType : String enum { Cellphone; House; Work;}
