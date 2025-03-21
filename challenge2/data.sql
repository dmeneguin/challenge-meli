
\c marketplace;

INSERT INTO "Customer"("id","email","nome","apelido","sexo","endereco","data_de_nascimento","telefone")
VALUES (1,'joao@email.com','joao','jo','masculino','rua abc 123','1993-03-23','1234-1234');

INSERT INTO "Customer"("id","email","nome","apelido","sexo","endereco","data_de_nascimento","telefone")
VALUES (2,'maria@email.com','maria','ma','feminino','rua cde 456','1989-05-22','2345-2345');

INSERT INTO "Customer"("id","email","nome","apelido","sexo","endereco","data_de_nascimento","telefone")
VALUES (3,'gilberto@email.com','gilberto','gil','masculino','rua fge 890','1998-06-02','4444-4444');

INSERT INTO "Customer"("id","email","nome","apelido","sexo","endereco","data_de_nascimento","telefone")
VALUES (4,'filomena@email.com','filomena','filo','feminino','rua qwerty 900','1999-04-01','5555-6666');




INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (1,'2020-02-15',1,800.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (2,'2020-02-15',1,500.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (3,'2020-03-15',1,300.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (4,'2020-03-15',1,300.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (5,'2020-03-15',1,1000.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (6,'2020-04-15',1,900.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (7,'2020-05-15',1,1300.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (8,'2020-05-15',1,1400.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (9,'2020-02-15',2,200.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (10,'2020-02-15',2,400.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (11,'2020-03-15',2,600.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (12,'2020-03-15',2,200.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (13,'2020-02-15',3,500.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (14,'2020-02-15',3,700.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (15,'2020-02-15',3,1000.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (16,'2020-03-15',3,800.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (17,'2020-03-15',3,200.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (18,'2020-03-15',3,300.0);

INSERT INTO "Order"("id","data_da_venda","customer_id_seller","valor_total")
VALUES (19,'2020-04-15',4,3400.0);



INSERT INTO "Category"("id","descricao","nome")
VALUES (1,'celular','celular');

INSERT INTO "Category"("id","descricao","nome")
VALUES (2,'ventilador','ventilador');




INSERT INTO "Item"("id","status","data_de_cancelamento","preco","category_id","name")
VALUES (1,'ativo',null,500,1,'celular A');

INSERT INTO "Item"("id","status","data_de_cancelamento","preco","category_id","name")
VALUES (2,'ativo',null,300,1,'celular B');

INSERT INTO "Item"("id","status","data_de_cancelamento","preco","category_id","name")
VALUES (3,'ativo',null,200,2,'ventilador');



INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (1,1,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (2,1,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (3,2,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (4,3,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (5,4,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (6,5,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (7,5,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (8,6,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (9,6,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (10,6,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (11,7,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (12,7,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (13,7,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (14,8,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (15,8,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (16,8,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (17,9,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (18,10,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (19,10,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (20,11,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (21,11,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (22,11,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (23,12,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (24,13,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (25,14,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (26,14,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (27,15,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (28,15,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (29,15,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (30,16,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (31,16,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (32,17,3);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (33,18,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (34,19,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (35,19,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (36,19,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (37,19,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (38,19,1);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (39,19,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (40,19,2);

INSERT INTO "Order_Item"("id","order_id","item_id")
VALUES (41,19,2);

