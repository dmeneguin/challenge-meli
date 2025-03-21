
CREATE DATABASE marketplace;

\c marketplace;

CREATE TABLE "Customer" (
    "id" INT NOT NULL,
    "email" VARCHAR(100),
    "nome" VARCHAR(100),
    "apelido" VARCHAR(30),
    "sexo" VARCHAR(10),
    "endereco" VARCHAR(100),
    "data_de_nascimento" DATE,
    "telefone" VARCHAR(40),
    CONSTRAINT "PK_Customer" PRIMARY KEY ("id")
);

CREATE TABLE "Order" (
    "id" INT NOT NULL,
    "data_da_venda" DATE,
    "valor_total" DOUBLE PRECISION,
    "customer_id_seller" INT NOT NULL,
    CONSTRAINT "PK_Order" PRIMARY KEY ("id"),
    CONSTRAINT "FK_Order_Customer" FOREIGN KEY ("customer_id_seller") REFERENCES "Customer" ("id")
);

CREATE TABLE "Category" (
    "id" INT NOT NULL,
    "descricao" VARCHAR(100),
    "nome" VARCHAR(100),
    "superior_category_id" INT,
    CONSTRAINT "PK_Category" PRIMARY KEY ("id"),
    CONSTRAINT "FK_Superior_Category" FOREIGN KEY ("superior_category_id") REFERENCES "Category" ("id")
);

CREATE TABLE "Item" (
    "id" INT NOT NULL,
    "status" VARCHAR(30),
    "data_de_cancelamento" DATE,
    "preco" DOUBLE PRECISION,
    "category_id" INT NOT NULL,
    "name" VARCHAR(30),
    CONSTRAINT "PK_Item" PRIMARY KEY ("id"),
    CONSTRAINT "FK_Item_Category" FOREIGN KEY ("category_id") REFERENCES "Category" ("id")
);

CREATE TABLE "Order_Item" (
    "id" INT NOT NULL,
    "order_id" INT NOT NULL,
    "item_id" INT NOT NULL,
    CONSTRAINT "PK_Order_Item" PRIMARY KEY ("id"),
    CONSTRAINT "FK_Order_Item_Order" FOREIGN KEY ("order_id") REFERENCES "Order" ("id"),
    CONSTRAINT "FK_Order_Item_Item" FOREIGN KEY ("item_id") REFERENCES "Item" ("id")
);
