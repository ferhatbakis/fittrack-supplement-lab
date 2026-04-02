---- 1. Tüm Supplement Stoklarını Görüntüle
--SELECT SuppName, RemainingServings, ExpiryDate 
--FROM dbo.Supplements;

---- 2. Kritik Stok Raporu (5 servisten az kalanlar)
--SELECT SuppName, RemainingServings 
--FROM dbo.Supplements
--WHERE RemainingServings <= 5;

---- 3. Son Kaydedilen Aktiviteler
---- WorkoutLogs tablonun sütunlarını da sp_help ile gördüysen oraya göre güncelleyebilirsin.
--SELECT TOP 10 * FROM dbo.WorkoutLogs 
--ORDER BY 1 DESC;