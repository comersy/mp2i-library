
##############################################
########ARITHMETIQUE CLASSIQUE################
##############################################


// Nombre Premier //

bool premier (int n) {
    bool p = true;
    if (n>=2) {
        for (int i = 2; i <= (n/2); i++) {
            if (n%i == 0) {
                p = false;
                break;
            }
        }
    }
    else {
        p = false;
    }
return p;
};


void liste_premier (int a, int n) {
    printf("Liste des nombres premier de %d à %d: ",a,n);
    for (int i = a; i <= n; i++) {
        if (premier (i)) {
            printf(" %d", i);
            }
    }
}




// Expo Rapide //

int expo_rap (int a, int n) {
    if (n == 0) {
        return 1;
        }
    else {
        int b = expo_rap (a, (n/2));
        if (n%2 == 0) {
            return b*b;
        }
        else {
            return a*b*b;
        }
    }
}




// PGCD //

int pgcd (int a, int b) {
    if (b == 0) 
        return a;
    else
        return pgcd (b, (a%b));
}




// Hanoi //

void hanoi (int n, int tige1, int tige2) {
    if (n==0) 
        return;
    else {
        int tige_int = 3 - tige1 - tige2;;
        hanoi ((n-1), tige1, tige_int);
        printf (" %d : -> %d ",tige1,tige2);
        hanoi ((n-1), tige_int, tige2);
    }
}




// Fibonacci //

int acc (int n, int a, int b) {
    if (n==0) {
        return b;
        }
    else {
        return (acc ((n-1), (a+b), a));
        }
}

int fibo (int n) {
    return acc (n,1,1);
}




############################
#########TABLEAU############
############################




//Somme//

int somme (int* t, int n) {
    int s = 0;
    for (int i= 0; i <n; i++){
        s += t[i];
    }
return s;
}


// Swap D'indice // 

void swap(int* t, int i, int j){
    int p = t[i];
    t[i] = t[j];
    t[j] = p;
}


// Trier Tableau O(n2) //

int* tri_bubble (int* t,int n) {
    for (int i = 0; i < n-1; i++) {
        for (int j = i+1; j<n; j++) {
            if (t[j]<t[i])
                swap (t,i,j);
        }
    }
return t;
}



// Renversement Tableau //

void reverse(int* t,int n){
    for (int i =0; i<=(n/2); i++) {
        swap (t,i,n-i-1);
    }
}


// Tableau des n premiers entiers //


int* range(int n){
    int* t = (int*)malloc(n*sizeof(int));
    for (int i = 0; i<n;i++){
        t[i] = i;
    }
return t;
}



// Print un Tableau //

void print_tab(int*t,int n) {
    for (int i=0; i<n; i++) {
        printf("%d ",t[i]);
    }
}

// Copie t1 dans t2 //

int* copy(int*t,int*t2,int n, int m){
    for (int i = n; i<m;i++){
        t2[i] = t[i-n];
    }
return t2;
}


// Concat deux tableaux //

int* concat(int* t1, int n1, int* t2, int n2){
    int* t3 = (int*)malloc((n1+n2)*sizeof(int));
    copy (t1,t3,0,n1);
    copy (t2,t3,n1,n2+n1);
    return t3;
}


// Dichotomie //

bool dichotomie (int* t, int i, int j, int e){
    if (i > j)
        return false;
    else {
        int m = (i+j)/2; 
        if (t[m] == e) 
            return true;
        else {
            if (t[m]>e)
                return dichotomie(t,i,(m-1),e);
            else
                return dichotomie(t,(m+1),j,e);
        }
    }
}


// Doublons? //

bool doublon (int* t,int n) {
    for (int i = 0; i < n-1; i++) {
        for (int j = i+1; j<n; j++) {
            if (t[j]==t[i])
                return true;
        }
    }
return false;
}



#################################
#######LISTES CHAINES############
#################################


struct list {
    int elem;
    list* next;
}

typedef struct list list


// ADD //

list* add(list* l, int e) {
    list* l1 = (list*)malloc(sizeof(list));
    l1 -> elem = e;
    l1 -> next = l;
    return l1;
}


// Listes des n premiers entiers //

list* range(int n){
    list* l = NULL;
    for (int i = 0; i<=n; i++) {
        l = add(l,i);
    }
return l;
}


// Print_liste //

void print_list(list* l) {
    while (l!=NULL) {
        printf("%d ",l->elem);
        l = l->next;
    }
}


// Element appartient à la liste? //

bool has(list* l, int e){
    while (l!=NULL) {
        if (l->elem == e)
            return true;
    }
return false;
}


// Taille d'une liste //


int size (list* l){
    int s = 0;
    while (l!=NULL) {
        s += 1;
        l = l-> next;
    }
    return s;
}


// Inverser une liste //

list* reverse (list* l){
    list* l1 = NULL;
    while (l!=NULL){
        l1 = add(l1,l->elem);
        l = l->next;
    }
return l1;
}


// Tri Bubble liste //

list* trier(list* l) {
    list* l1;
    list* l2;
    int a;
    if(l!=NULL) {
        for (l1 = l; l1 -> next != NULL; l1 = l1->next){
            
            for (l2 = l1->next; l2!=NULL; l2 = l2->next){
                
                if (l2->elem < l1->elem){
                    
                    a = l2->elem;
                    l2-> elem = l1->elem;
                    l1->elem = a;
                }
            }
        }
            
    }
return l;
}



// Fusion de deux listes triés //


list* fusion(list* l1,list* l2) {
    if (l1 == NULL)
        return l2;
    else {
        if (l2 == NULL)
            return l1;
        else {
            if (l1 -> elem < l2 -> elem) 
                return add ((fusion (l1->next, l2)),l1->elem);
            else
                return add ((fusion (l1, l2->next)),l2->elem);
        }
    }
}
