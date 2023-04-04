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