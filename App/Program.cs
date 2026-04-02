using Microsoft.Data.SqlClient;
using System;

namespace FitTrackConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            // 1. BAĞLANTI DİZESİ: Burayı kendi bilgisayarına göre güncellemelisin!
            // Server kısmına SSMS girişindeki 'Server Name'i yaz.
            string connectionString = "Server=LAPTOP-XXXXX;Database=FitTrackDB;Trusted_Connection=True;TrustServerCertificate=True;";

            Console.WriteLine("=== FİTTRACK & SUPPLEMENT LAB VERİLERİ ÇEKİLİYOR ===\n");

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    Console.WriteLine("[BAŞARILI] Veritabanına bağlanıldı.\n");

                    // 2. SQL SORGUSU
                    string query = "SELECT SuppName, RemainingServings, DailyDosage FROM dbo.Supplements";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            Console.WriteLine("{0,-20} | {1,-10} | {2,-10}", "Ürün Adı", "Kalan", "Günlük");
                            Console.WriteLine("-------------------------------------------------------------");

                            while (reader.Read())
                            {
                                // Sütunları SQL'deki isimleriyle çekiyoruz
                                string name = reader["SuppName"].ToString();
                                int remaining = Convert.ToInt32(reader["RemainingServings"]);
                                int dosage = Convert.ToInt32(reader["DailyDosage"]);

                                // Ekrana yazdırırken stok azsa uyarı verelim (Yazılımcı dokunuşu!)
                                string alert = remaining <= 5 ? "!!! STOK KRİTİK !!!" : "Tamam";

                                Console.WriteLine("{0,-20} | {1,-10} | {2,-10} | {3}", name, remaining, dosage, alert);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("[HATA] Bir şeyler ters gitti: " + ex.Message);
            }

            Console.WriteLine("\nÇıkmak için bir tuşa basın...");
            Console.ReadKey();
        }
    }
}
