domains
    patient = symbol.
    doctor = symbol.
    date = symbol.
    diagnosis = symbol.

database
    patients(patient, doctor, date, diagnosis).

predicates
    patientsOnDate(date, doctor, patient).
    patientDiagnoses(patient, Diagnoses:list[diagnosis]).
    totalPatients(doctor, Count:int).
    averageVisits(doctor, Average:float).

clauses
    patientsOnDate(Date, Doctor, Patient) :-
        patients(Patient, Doctor, Date, _).

    patientDiagnoses(Patient, Diagnoses) :-
        patients(Patient, _, _, Diagnoses).

    totalPatients(Doctor, Count) :-
        findall(Patient, patients(Patient, Doctor, _, _), Patients),
        length(Patients, Count).

    averageVisits(Doctor, Average) :-
        findall(Patient, patients(Patient, Doctor, _, _), Patients),
        length(Patients, Count),
        Count > 0,
        Total = Count,
        Sum is Total,
        Average is Sum / Total.

    run :-
        consult("patients.txt"), % Загрузка данных из файла patients.txt

