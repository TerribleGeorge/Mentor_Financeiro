# Securitate - Mentor Financeiro

**Ultima actualizare:** 19 mai 2026

Această pagină explică practicile de securitate Mentor Financeiro într-un limbaj simplu. Acesta completează Politica de confidențialitate și Termenii de utilizare.

## 1. Angajamentul de securitate

Mentor Financeiro a fost dezvoltat pentru a ajuta la organizarea financiară fără a solicita acces direct la contul bancar, fără a solicita o parolă bancară și fără a funcționa ca bancă, broker sau metodă de plată.

Aplicația poate stoca date financiare introduse de dvs. sau identificate prin caracteristici opționale, motiv pentru care tratăm securitatea ca pe o parte centrală a produsului.

## 2. Ce nu face aplicația

- Nu cere parola bancii, cardul sau portofelul digital.
- Nu vă accesează contul bancar.
- Nu mișcă bani.
- Nu efectuează plăți, Pix, transferuri sau investiții în numele dvs.
- Nu solicită codul de securitate al cardului.
- Nu solicită cod bancar OTP.
- Nu vinde datele dumneavoastră personale.

## 3. Măsuri tehnice utilizate

În funcție de resursa utilizată, aplicația poate folosi:

- Conectați-vă de către Firebase Authentication.
- Cloud Firestore cu datele asociate utilizatorului autentificat.
- Reguli de securitate pentru a restricționa accesul la datele proprii ale utilizatorului.
- Comunicare criptată de SDK-urile și serviciile utilizate.
- Firebase Crashlytics pentru a identifica defecțiunile tehnice și a remedia problemele.
- Permisiunile Android sunt solicitate numai atunci când sunt legate de funcțiile aplicației.
- Stocare locală pentru preferințe, temă, cache și date de dispozitiv.

## 4. Monitorizarea notificărilor

Monitorizarea notificărilor este opțională și necesită activarea manuală pe Android.

Când este activată, aplicația poate citi notificările acceptate pentru a recunoaște cheltuielile, achizițiile, plățile, abonamentele și transferurile. Scopul este de a reduce munca manuală la înregistrarea cheltuielilor.

Pentru a reduce riscurile:

- Aplicația vă informează despre motivul permisiunii înainte de a vă direcționa către setări.
- Accesul poate fi revocat în orice moment în setările Android.
- Filtrul caută evenimente financiare compatibile, nu conversații personale.
- Aplicația încearcă să ignore codurile OTP, parolele, codurile de securitate și mesajele de autentificare.
- Aplicația nu folosește această funcție pentru a accesa bănci, carduri sau portofele digitale.

Chiar și așa, notificările pot conține date sensibile. Utilizați această funcție numai dacă sunteți de acord cu acest tip de prelucrare.

## 5. Permisiuni sensibile

Aplicația poate solicita:

- **Internet:** conexiune la Firebase, Google Play, API-uri și resurse online.
- **Notificări:** trimiterea de alerte din aplicația în sine.
- **Locație:** adaptarea conținutului sau comparații la țară/regiune, atunci când este autorizat.
- **Acces la notificări Android:** identificarea opțională a cheltuielilor din notificările compatibile.
- **Achiziții în aplicație:** abonament Premium de către Google Play.

Controlați aceste permisiuni în setările Android.

## 6. Partea ta în securitate

Pentru a vă proteja datele:

- Utilizați blocarea ecranului pe dispozitiv.
- Nu vă împărtășiți contul.
- Păstrați aplicația și Android actualizate.
- Revocați permisiunile pe care nu mai doriți să le utilizați.
- Verificați tranzacțiile identificate automat înainte de a lua decizii.
- Nu înregistrați informații pe care nu doriți să le păstrați în aplicație.
- Anulați abonamentele direct la Google Play când nu doriți să reînnoiți.

## 7. Limitări

Nicio aplicație, server, sistem de operare sau serviciu cloud nu este 100% sigură. În ciuda măsurilor adoptate, pot apărea eșecuri, indisponibilitate, erori de sincronizare, pierderea accesului, probleme ale terților sau încercări externe de abuz.

Mentor Financeiro încearcă să reducă riscurile în mod rezonabil, dar trebuie să păstrați copii sau să controlați propriile informații financiare esențiale.

## 8. Incidente și contact

Dacă observați un comportament ciudat, acces necorespunzător, date incorecte, suspiciune de încălcare a securității sau probleme cu permisiunile sensibile, vă rugăm să contactați:

**george.guimares@gmail.com**

Includeți, dacă este posibil:

- Modelul dispozitivului.
- Versiunea Android.
- Versiunea aplicației.
- Descrierea problemei.
- Capturi de ecran fără a expune parole, coduri sau date excesive.
