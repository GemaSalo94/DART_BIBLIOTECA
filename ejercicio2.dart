import 'dart:io';

//Ejercicio 2 con funcionalidades extra
//Clase Libro con los atributos titulo y autor
class Libro {
  String titulo;
  String autor;

  //Constructor de la clase Libro
  Libro(this.titulo, this.autor);
}

//Clase Biblioteca
class Biblioteca {
  //Lista para almacenar los libros
  List<Libro> librosDisponibles = [];
  //metodo para agregar los libros
  void agregarLibro(Libro libro) {
    librosDisponibles.add(libro);
  }

  //Metodo para comprobar si el libro esta disponible o no
  bool estaDisponible(String titulo) {
    for (var libro in librosDisponibles) {
      if (libro.titulo.toLowerCase() == titulo.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  //Metodo para mostrar la lista de libros al usuario
  void mostrarLibros() {
    print("Libros disponibles en la biblbioteca: ");
    for (var libro in librosDisponibles) {
      print("- ${libro.titulo} de ${libro.autor}");
    }
  }
}

void main() {
  //Creamos la biblioteca y añadimos libros
  Biblioteca biblioteca = Biblioteca();
  var libro1 = Libro("Los juegos del Hambre", "Suzanne Collins");
  biblioteca.agregarLibro(libro1);

  var libro2 = Libro("Los siete maridos de Evelyn Hugo", "Taylor Jenkins Reid");
  biblioteca.agregarLibro(libro2);

  var libro3 = Libro("Cumbres Borrascosas", "Emily Brontë");
  biblioteca.agregarLibro(libro3);

  var libro4 = Libro("La vida invisible de Addie LaRue", "V.E. Schwab");
  biblioteca.agregarLibro(libro4);

  //Llamada al metodo mostrarLibros para mostrar la lista de libros disponibles
  biblioteca.mostrarLibros();

  //Solicitamos al usuario que busque un libro para comprobar si existe
  print("Introduce el libro que estas buscando: ");
  String? buscadorLibros = stdin.readLineSync();
  if (buscadorLibros != null) {
    if (!biblioteca.estaDisponible(buscadorLibros.trim())) {
      print("Lo sentimos, el libro que buscas no esta disponible");
    } else {
      print("El libro que buscas esta disponible");
    }
  }
}
