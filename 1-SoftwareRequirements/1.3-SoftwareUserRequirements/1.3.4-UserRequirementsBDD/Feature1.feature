Feature: Публікування відео
As a художник я можу запостити фото
In order to колеги художники оцінили мою роботу
I want to був фітбек від художників, для адекватної оцінки роботи.

Scenario 1: Пости мають лайки та дізлайки
Given художник лайкнув мій пост
And пост вже має кілька лайків
When художник лайкає мій пост
Then я маю бачити, що лайки збільшились на +1 та бачу список хто вподобав світлину.

Scenario 2: Художники можуть коментувати світлину
Given художник залишив коментар під світлиною
And під постом вже є коментар
When художник залишив свій коментар
Then я маю бачити, усі залишені коментарі
And можу відповісти на коментарі.
