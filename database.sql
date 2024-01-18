CREATE DATABASE atividade_relacionamentos_nen

CREATE TABLE areas (
   "id" SERIAL PRIMARY KEY,
   "name" VARCHAR(200) NOT NULL
);

CREATE TABLE courses (
   "id" SERIAL PRIMARY KEY,
   "name" VARCHAR(200) NOT NULL
);

CREATE TABLE courses_areas(
   "id" SERIAL PRIMARY KEY,
   "areaId" INTEGER NOT NULL,
   "courseId" INTEGER NOT NULL,
   FOREIGN KEY ("areaId") REFERENCES areas("id") ON DELETE CASCADE,
   FOREIGN KEY ("courseId") REFERENCES courses("id") ON DELETE CASCADE
);

INSERT INTO areas ("name") VALUES ('Engenharia'),('Medicina'),('Eletrica') RETURNING *;

INSERT INTO courses ("name") VALUES ('Engenharia Civil'),('Dentista'),('Eletrotecnica') RETURNING *;

INSERT INTO courses_areas ("areaId","courseId") VALUES (1,1),(2,2),(3,3) RETURNING *;
INSERT INTO courses_areas ("areaId","courseId") VALUES (4,1) RETURNING *;