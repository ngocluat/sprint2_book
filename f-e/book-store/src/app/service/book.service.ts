import {Injectable} from '@angular/core';
import {environment} from '../../environments/environment';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {BookDto} from '../model/BookDto';


const API_URL = `${environment.apiUrl}`;

@Injectable({
  providedIn: 'root'
})
export class BookService {

  constructor(private http: HttpClient) {
  }

  getAll(request): Observable<BookDto[]> {
    const params = request;
    return this.http.get<BookDto[]>(`${API_URL}/books`, {params});
  }

  public findBookById(id: number): Observable<BookDto> {
    return this.http.get<BookDto>(`${API_URL}/books/${id}`);
  }

  getTop10RelativeBook(bookId: number): Observable<BookDto[]> {
    return this.http.get<BookDto[]>(`${API_URL}/books/relative/${bookId}`);
  }
}
