/*
 * ####################################
 * #     Занятие 2                    #  
 * #     Работа с командой SELECT     #
 * ####################################
 */

 /*
 пвравэлправэлпэавл
 жлавопржлдаоплжо
 */
 --аывпаывжпоо
 --апав п

/*
 * +----------------+
 * | Команда SELECT |
 * +----------------+
 */

-- вывести все данные по продуктам
select * from db_laba.dbo.products;
select * from db_laba.dbo.product_categories;


-- вывести все данные по заказам
select * from db_laba.dbo.orders;
select * from orders;


-- вывести все данные по странам
select * from db_laba.dbo.countries;
select * from db_laba.dbo.locations

-- вывести все данные по регионам
select * from db_laba.dbo.regions;


-- вывести все данные по продуктам перечисляя поля (колонки)
select product_id, product_name, description, standard_cost, list_price, category_Id from db_laba.dbo.products;

--вывести все данные по продуктам перечисляя поля (колонки) - 2й способ с форматированием
select product_id, product_name,
	   description,
	   standard_cost,
	   list_price,
	   category_id
  from db_laba.dbo.products;

-- вывести не все данные по продуктам перечисляя поля (колонки) - 2й способ используя алиас (псевдоним)
select p.product_id
	   ,p.product_name
	   ,p.description
	   ,p.standard_cost
	   ,p.list_price
	   --,p.category_id
	   --,p.list_price
  from db_laba.dbo.products p;

  select t1.description, t1.list_price from db_laba.dbo.products t1
  
/*
 * +-------------------+
 * | Оператор DISTINCT |
 * +-------------------+
 */
 -- вывести уникальный список категорий для таблицы продуктов
 -- отсортировать по возрастанию
select distinct (p.category_id)
  from db_laba.dbo.products p
  order by 1;

  select p.category_id cat
  from db_laba.dbo.products p
  order by 1;

   select p.category_id cat
  from db_laba.dbo.products p
  order by p.category_id;
 
/*
 * +-----------------------+
 * | Реляционные операторы |
 * +-----------------------+
 */
-- вывести имя продукта, описание и стандартную стоимось по продуктам
-- для продуктов стандартной стоимостью не менее 3000
-- результат отсортировать по имени продукта
select p.product_name
	   ,p.description
	   ,p.standard_cost
  from db_laba.dbo.products p
 --where p.standard_cost >= 3000
 --where p.standard_cost = 4058.99
 where p.standard_cost != 4058.99
 --order by p.product_name desc;
 order by p.standard_cost asc;
 
/*
 * +------------------+
 * | Булевы операторы |
 * +------------------+
 */
 --AND OR NOT

-- вывести имя продукта, описание и стандартную стоимось
-- по продуктам 1-й и 2-й категории
-- со стандартно стоимостью более 2500
select p.product_name
	   ,p.description
	   ,p.standard_cost
	   --,p.list_price
	   --,p.category_id
  from db_laba.dbo.products p where p.category_id in (1, 2)              and p.standard_cost > 2500;
 
-- вывести имя продукта, описание, категорию и стандартную стоимость
-- по продуктам 1-й категории
-- или со стандартно стоимостью более 5000
-- результат отсортировать по категории по убыванию и по стандартной стоимости по возрастанию
select p.product_name
	   ,p.description
	   ,p.category_id
	   ,p.standard_cost
	   --,p.list_price	   
  from db_laba.dbo.products p
 where p.category_id = 1
 or p.standard_cost > 5000
 --order by p.category_id desc, p.standard_cost
 order by p.category_id desc, 4
/*
 * +------------------+
 * | Оператор between |
 * +------------------+
 */
-- вывести имя продукта, описание и стандартную стоимось по продуктам
-- со стандартной стоимосмью от 500 до 800
-- результат отсортировать по возрастанию стандартной стоимости
select p.product_name
	   ,p.description
	   ,p.standard_cost
	   --,p.list_price
  from db_laba.dbo.products p
  --where p.standard_cost >= 500 and p.standard_cost <= 800
 where p.standard_cost between 500 and 800
 order by p.standard_cost

-- вывести имя продукта, описание и стандартную стоимось по продуктам
-- со стандартной стоимосмью от 500 до 800
-- для всех категории, кроме 1, 2, 3, 4
-- результат отсортировать по убыванию стандартной стоимости
select p.product_name
	   ,p.description
	   ,p.standard_cost
	   --,p.list_price
	   --,p.category_id
  from db_laba.dbo.products p
 where p.standard_cost between 500 and 800
   and p.category_id NOT IN (1, 2, 3, 4) 
 order by p.standard_cost desc;

 /*
 sorting

 order by p.standard_cost desc -сортировка по убыванию
 order by p.standard_cost asc -сортировка по ворастанию
 order by p.standard_cost  -сортировка по ворастанию по умалчанию asc
 */

/*
 * +---------------+
 * | Оператор LIKE |
 * +---------------+
 */
-- вывести имя продукта, описание и стандартную стоимось по продуктам
-- для продуктов имена которых начинаються на букву K
-- результат отсортировать по имени продукта
select p.product_name
	   ,p.description
	   ,p.standard_cost
	   --,p.list_price
	   --,p.category_id
  from db_laba.dbo.products p
 where p.product_name like 'K%' -- '%<string>%'
 --where p.product_name like '%k' -- '%<string>%'
 order by p.product_name desc;

 --'K' = 'k'



/*
 * +------------------------------------+
 * | Работа с NULL (пустыми значениями) |
 * +------------------------------------+
 */
-- ''
 -- вывести содержимое таблицы locations
 -- где индекс пустой (null)
 SELECT location_id
		,address
		,city
		,postal_code
		,state
		,country_id
  FROM db_laba.dbo.locations
  --where postal_code = '6823' --NULL
  --where postal_code = NULL
  where postal_code is NULL;

/*
 * +-----------------------------------------------+
 * | Использование NOT со специальными операторами |
 * +-----------------------------------------------+
 */
 -- вывести содержимое таблицы locations
 -- где индекс не пустой 
 SELECT location_id
		,address
		,postal_code
		,city
		,state
		,country_id
  FROM db_laba.dbo.locations
  where postal_code is not NULL;
  --where not postal_code is NULL
-- таким же способом Вы можете использовать NOT BETWEEN и NOT LIKE.