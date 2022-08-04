import {Injectable} from '@angular/core';
import {BookDto} from '../model/BookDto';
import {CartDto} from '../model/CartDto';
import {HttpClient} from '@angular/common/http';
import {CartAndDetailDto} from '../model/CartAndDetailDto';
import {Observable} from 'rxjs';
import {environment} from '../../environments/environment';

const API_URL = `${environment.apiUrl}`;

@Injectable({
  providedIn: 'root'
})
export class CartService {

  constructor(private http: HttpClient) {
  }

  addToCart(book: BookDto, quantity: number) {
    let cartDtoList: CartDto[] = [];
    if (localStorage.getItem('cart')) {
      cartDtoList = JSON.parse(localStorage.getItem('cart'));
    }
    let exists = false;

    cartDtoList.forEach(item => {
      if (item.book.id == book.id) {
        exists = true;
        if (quantity < 1 && item.quantity == 1) {
          item.quantity = 1;
        } else {
          item.quantity += quantity;
        }
      }
    });

    if (!exists && quantity > 0) {
      let cartDto = {} as CartDto;
      cartDto.quantity = quantity;
      cartDto.book = book;
      cartDtoList.push(cartDto);
    }

    localStorage.setItem('cart', JSON.stringify(cartDtoList));
  }

  getCart(): CartDto[] {
    return JSON.parse(localStorage.getItem('cart'));
  }

  getCartLength(): number {
    if (localStorage.getItem('cart')) {
      return JSON.parse(localStorage.getItem('cart')).length;
    } else {
      return 0;
    }
  }

  sendCartDetailToAPI(cartAndDetailDto: CartAndDetailDto): Observable<any> {
    return this.http.post<CartAndDetailDto>(`${API_URL}/check-out/check`, cartAndDetailDto);
  }

  removeItemFromCart(book: BookDto) {
    let cartDtoList: CartDto[] = [];
    if (localStorage.getItem('cart')) {
      cartDtoList = JSON.parse(localStorage.getItem('cart'));
    }
    cartDtoList = cartDtoList.filter(item => item.book.id !== book.id);
    localStorage.setItem('cart', JSON.stringify(cartDtoList));
  }

  clearCart() {
    localStorage.removeItem('cart');
  }
}
