![](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/oleksandrblazhko/ai202-baranyuk/laboratory-work-8/2-SoftwareDesign/2.8-TestCases/1-FR-Specification.puml)

1) вхідні параметри:

1.1) post_mark - оцінка публікації надана користувачем (число):
- умова 1 – post_mark більше 0;
- умова 2 - post_mark менше 11; 

1.2) word_mark - оцінка словом (рядок символів):
- умова 3 – довжина рядка word_mark не більше 20 символів;

2) значення, що повертаються функцією:
- значення = 1 – оцінка успішно надана;
- значення = -1 – чисельна оцінка не відповідає умовам;
- значення = -2 – словесна оцінка не відповідає умовам.
