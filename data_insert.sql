---- Supplements tablosunda hangi sütunlar var?
--EXEC sp_help 'dbo.Supplements';

---- WorkoutLogs tablosunda hangi sütunlar var?
--EXEC sp_help 'dbo.WorkoutLogs';

/* FitTrack & Supplement Lab - Veri Analiz Sorguları */

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

-- Supplements tablosuna gerçekçi veriler
INSERT INTO dbo.Supplements (SuppName, TotalServings, RemainingServings, DailyDosage, ExpiryDate)
VALUES 
('Whey Protein Isolate', 60, 42, 1, '2026-12-01'),
('BCAA 2:1:1', 30, 3, 1, '2025-10-15'), -- Bu kritik stokta çıkacak
('Creatine Monohydrate', 50, 48, 1, '2027-03-20'),
('Cream of Rice', 40, 8, 2, '2026-06-10');

-- WorkoutLogs tablosuna antrenman kaydı
-- Sütun isimlerini görselindeki LogID, ExerciseName, Sets, Reps, WeightKG, LogDate'e göre ayarladım
INSERT INTO dbo.WorkoutLogs (ExerciseName, Sets, Reps, WeightKG, LogDate)
VALUES 
('Bench Press', 4, 10, 80, GETDATE()),
('Squat', 4, 8, 100, GETDATE()),
('Deadlift', 3, 5, 140, DATEADD(DAY, -1, GETDATE()));