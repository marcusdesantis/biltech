namespace backend_api_core.Utils
{
    public enum AbmAccion
    {
        GUARDAR   = 1,
        MODIFICAR  = 2,
        ELIMINAR_BAJA = 3,
    }

    public enum FormatoFecha
    {
        EN = 1,
        ES = 2
    }

    public enum EnumNsecCentroDonacion
    {
        BANCO_SANGRE = 1
    }
    public enum EnumNsecProceso
    {
        PRUEBA = 1
    }
    public enum EnumNsecEstadoRuds
    {
        PRUEBA = 1
    }

    public enum EnumNsecNodo
    {
        DONANTE   = 1,
        SELECCION_LABORATORIAL  = 2,
        SELECCION_MEDICO = 3,
        LABORATORIO_PREVIA_SEROLOGIA = 4,
        EXTRACCION = 5,
        CENTRIFUGACION = 6,
        LABORATORIO_SEROLOGIA = 7,
        LABORATORIO_HEMATOLOGIA = 8,
        LIBERACION_CUARENTENA = 9,
        LIBERACION_UT = 10,
    }
    public enum EnumNsecPruebasGrupoSanguineo
    {
        TEST_DIRECTA_EN_TUBO = 9
        , PRUEBA_REVERSA = 10
    }



}
