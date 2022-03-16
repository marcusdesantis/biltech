using System;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace backend_api_core.Utils
{
    public static class SecurityPwd
    {
        private static String key = "C4p0n3.ttt";
        private static byte[] arrKey;

        public static String Encrypt(String _string)
        {
            byte[] arCadena = UTF8Encoding.UTF8.GetBytes(_string);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();

            arrKey = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(_string));
            md5.Clear();

            tdes.Key = arrKey;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;
            ICryptoTransform cadTran = tdes.CreateEncryptor();
            byte[] resultado = cadTran.TransformFinalBlock(arCadena, 0, arCadena.Length);
            tdes.Clear();

            return Convert.ToBase64String(resultado, 0, resultado.Length);
        }

        public static string Decrypt(string cipherString)
        {
            byte[] keyArray;
            //get the byte code of the string
            bool useHashing = true;

            if (!String.IsNullOrEmpty(cipherString))
            {

                byte[] toEncryptArray = Convert.FromBase64String(cipherString);

                System.Configuration.AppSettingsReader settingsReader =
                                                    new AppSettingsReader();
                //Get your key from config file to open the lock!
                //string key = (string)settingsReader.GetValue(clave, typeof(String));
                string _key = key;

                if (useHashing)
                {
                    //if hashing was used get the hash code with regards to your key
                    MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                    keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(_key));
                    //release any resource held by the MD5CryptoServiceProvider

                    hashmd5.Clear();
                }
                else
                {
                    //if hashing was not implemented get the byte code of the key
                    keyArray = UTF8Encoding.UTF8.GetBytes(_key);
                }

                TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
                //set the secret key for the tripleDES algorithm
                tdes.Key = keyArray;
                //mode of operation. there are other 4 modes. 
                //We choose ECB(Electronic code Book)

                tdes.Mode = CipherMode.ECB;
                //padding mode(if any extra byte added)
                tdes.Padding = PaddingMode.PKCS7;

                ICryptoTransform cTransform = tdes.CreateDecryptor();
                byte[] resultArray = cTransform.TransformFinalBlock(
                                     toEncryptArray, 0, toEncryptArray.Length);
                //Release resources held by TripleDes Encryptor                
                tdes.Clear();
                //return the Clear decrypted TEXT
                return UTF8Encoding.UTF8.GetString(resultArray);
            }
            else
            {
                return cipherString;
            }
        }
    }
}
