# DataBases

> Bold : Key κάποιου τύπου
> Italics : Επιπλέον πεδία που δεν αναφέρονται στην εκφώνηση

## Entities - Relationships - Attributes

### Κατάστημα
#### Attributes καταστήματος:
Το κάθε bullet είναι ένα attribute
- Ωράριο
- Διεύθυνση : composite attribute, με πεδία
  - Πόλη
  - Δρόμος
  - Αριθμός
- Τετραγωνικά
- Κατηγορίες Προϊόντων : Εδώ δεν ξέρω πώς πρέπει να συμπεριληφθούν τα είδη κατηγοριών και η πληροφορία ότι κάθε κατηγορία περιέχει 10-20 προϊόντα
  - Φρέσκα προϊόντα
  - Είδη ψυγείου
  - Είδη κάβας
  - Είδη προσωπικής περιποίησης
  - Είδη σπιτιού
  - Για κατοικίδια
### Relationships καταστήματος  
- 

### Προϊόν
#### Attributes προϊόντος:
- Τιμή (κρατάμε ιστορικό αλλαγών)
- Διάδρομος όπου βρίσκεται
- Κατηγορία όπου ανήκει
- Είναι ή όχι own brand 
- ***Barcode*** (PK)

### Πελάτης
#### Attributes Πελάτη
- **Αριθμός κάρτας** (FK για την HoldsCard)
- Προσωπικά στοιχεία (composite)
  - Ον/μο 
  - **ΑΔΤ** (PK)
  - Τηλέφωνο
  - Διεύθυνση κατοικίας
  - Ημερομηνία γέννησης
- Οικογενειακά στοιχεία (επίσης composite)
  - Μέλη οικογένειας (τι στοιχεία κρατάμε για αυτούς;; μόνο αν έχουν κι αυτοί κάρτα)
#### Relationships πελάτη
- Holds Card: Attribute της σχέσης ο αριθμός κάρτας

### Συναλλαγή (Αγορά - Purchase)
#### Attributes συναλλαγής
- Συνολικό κόστος (derived - συνάγεται από το άθροισμα των τιμών των προϊόντων που περιλαμβάνει)
- Προϊόντα που αγοράστηκαν
- Ώρα συναλλαγής
- Τρόπος πληρωμής
- ***Αριθμός συναλλαγής*** (PK)

### Κάρτα (weak entity)
#### Attributes κάρτας
- **Αριθμός κάρτας**


  
