CREATE DATABASE clinic;

CREATE TABLE patients (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INTEGER ,
  status VARCHAR(255)  
);

ALTER TABLE medical_histories
ADD CONSTRAINT fk_patients
  FOREIGN KEY (patient_id)
  REFERENCES patients(id);

CREATE TABLE invoices (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INTEGER  
);

ALTER TABLE invoices
ADD CONSTRAINT fk_medical_histories
  FOREIGN KEY (medical_history_id)
  REFERENCES medical_histories(id);

CREATE TABLE procedures (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  medical_histories_id INTEGER,
  treatment_id INTEGER  
);

CREATE TABLE treatments (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR,
  name VARCHAR(255)
);

ALTER TABLE procedures
ADD CONSTRAINT fk_medical_histories
  FOREIGN KEY (medical_histories_id)
  REFERENCES medical_histories(id);

ALTER TABLE procedures
ADD CONSTRAINT fk_treatments
  FOREIGN KEY (treatment_id)
  REFERENCES treatments(id);

CREATE TABLE invoice_items (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL,
  quantity INTEGER,
  total_price DECIMAL,
  invoice_id INTEGER,
  treatment_id INTEGER  
);

ALTER TABLE invoice_items
ADD CONSTRAINT fk_invoice
  FOREIGN KEY (invoice_id)
  REFERENCES invoices(id);

ALTER TABLE invoice_items
ADD CONSTRAINT fk_treatment
  FOREIGN KEY (treatment_id)
  REFERENCES treatments(id);

