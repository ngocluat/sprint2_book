import {Injectable} from '@angular/core';
import {environment} from '../../environments/environment';
import {HttpClient} from '@angular/common/http';
import {BehaviorSubject, Observable} from 'rxjs';
import {CartAndDetailDto} from '../model/CartAndDetailDto';

const API_URL = `${environment.apiUrl}`;

@Injectable({
  providedIn: 'root'
})
export class CheckOutService {

  private cartAndDetail = new BehaviorSubject<CartAndDetailDto>({});

  constructor(private http: HttpClient) {
  }

  setCartAndDetail(cartAndDetail: CartAndDetailDto) {
    this.cartAndDetail.next(cartAndDetail);
  }

  getCartAndDetail() {
    return this.cartAndDetail.asObservable();
  }

  saveCartAndDetailAPI(cartAndDetailDto: CartAndDetailDto): Observable<any> {
    return this.http.post<CartAndDetailDto>(`${API_URL}/check-out`, cartAndDetailDto);
  }
}
