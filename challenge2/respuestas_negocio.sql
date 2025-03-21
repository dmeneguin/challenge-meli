SELECT c.id, SUM(o.valor_total) as total_de_vendas FROM "Customer" c
LEFT JOIN "Order" o
on c.id = o.customer_id_seller
where 
EXTRACT(MONTH FROM c.data_de_nascimento) = EXTRACT(MONTH FROM current_date) and 
EXTRACT(DAY FROM c.data_de_nascimento) = EXTRACT(DAY FROM current_date) and 
EXTRACT(MONTH FROM o.data_da_venda) = 1 and 
EXTRACT(YEAR FROM o.data_da_venda) = 2020
group by c.id
HAVING SUM(o.valor_total) > 1500;


select * from (
select  cus.nome, 
		cus.apelido, 
		count(i.id) as qtd_celulares, 
		count(o.id) as qtd_vendas, 
		sum(i.preco) as montante_total,
		extract (month from o.data_da_venda) as mes_venda,
		extract (year from o.data_da_venda) as ano_venda,
		row_number() over(partition by 
		extract (month from o.data_da_venda),
		extract (year from o.data_da_venda)
		order by sum(i.preco) desc
		) as rank_vendas_mes
from "Order_Item" oi
left join "Order" o
on oi.order_id = o.id
left join "Item" i
on oi.item_id=i.id
left join "Category" c
on i.category_id = c.id
left join "Customer" cus
on o.customer_id_seller = cus.id
where c.nome = 'celular' and extract (year from o.data_da_venda) = 2020
group by cus.nome,cus.apelido,mes_venda,ano_venda,o.customer_id_seller) where rank_vendas_mes < 5;



CREATE TABLE "Items_Daily_Status"(
	"id" INT NOT NULL,
    "status" VARCHAR(30),
    "preco" DOUBLE PRECISION,
    "name" VARCHAR(30),
	CONSTRAINT "PK_Items_Daily_Status" PRIMARY KEY ("id")
);

CREATE OR REPLACE PROCEDURE populate_items_daily_status()
LANGUAGE SQL
AS $$
TRUNCATE TABLE "Items_Daily_Status";
INSERT INTO "Items_Daily_Status" ("id", "status", "preco", "name")
SELECT "id", "status", "preco", "name"
FROM "Item";
$$;

CALL populate_items_daily_status();
