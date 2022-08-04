import {Component, OnInit} from '@angular/core';
import {CartDto} from '../../model/CartDto';
import {BookDto} from '../../model/BookDto';
import {CartService} from '../../service/cart.service';
import {TokenStorageService} from '../../service/security/token-storage.service';
import {Router} from '@angular/router';
import {Title} from '@angular/platform-browser';
import {CartAndDetailDto} from '../../model/CartAndDetailDto';
import {ToastrService} from 'ngx-toastr';
import {Customer} from '../../model/Customer';
import {CheckOutService} from '../../service/check-out.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  cartDtoList: CartDto [] = [];
  total = 0;
  bookDelete = {} as BookDto;
  username: string;

  constructor(private cartService: CartService,
              private title: Title,
              private route: Router,
              private tokenStorageService: TokenStorageService,
              private toastrService: ToastrService,
              private checkOutService: CheckOutService) {
  }

  ngOnInit(): void {
    this.title.setTitle('Giỏ hàng - BookCode');
    if (this.tokenStorageService.getUser() != null) {
      this.username = this.tokenStorageService.getUser().username;
      console.log(this.username);
    }
    this.cartDtoList = this.cartService.getCart();
    this.total = this.getTotal();
  }

  reload() {
    this.ngOnInit();
  }

  getTotal(): number {
    let total = 0;
    if (this.cartDtoList != null) {
      this.cartDtoList.forEach(item => {
        total += (item.quantity * item.book.price);
      });
    }
    return total;
  }

  removeItem(book: BookDto) {
    this.cartService.removeItemFromCart(book);
    this.cartDtoList = this.cartService.getCart();
    this.total = this.getTotal();
  }

  reduceItem(medicine: BookDto) {
    this.cartService.addToCart(medicine, -1);
    this.cartDtoList = this.cartService.getCart();
    this.total = this.getTotal();

  }

  increaseItem(book: BookDto) {
    this.cartService.addToCart(book, 1);
    this.cartDtoList = this.cartService.getCart();
    this.total = this.getTotal();
  }

  getBookDelete(book: BookDto) {
    this.bookDelete = book;
  }

  confirmCart() {
    if (this.username == null) {
      this.toastrService.warning('Bạn cần đăng nhập để thực hiện thao tác', 'Yêu cầu đăng nhập', {
        timeOut: 2000,
        progressBar: true,
      });
    } else {
      let customer = {} as Customer;
      customer.email = this.username;
      let cartAndDetailDto = {} as CartAndDetailDto;
      cartAndDetailDto.cartDtoList = this.cartDtoList;
      cartAndDetailDto.customer = customer;
      cartAndDetailDto.total = this.total;
      this.cartService.sendCartDetailToAPI(cartAndDetailDto).subscribe(data => {
        this.checkOutService.setCartAndDetail(data);
        this.route.navigate(['/check-out']);
        // }, error => {
        //   this.medicineErrorArray = [];
        //   for (let i = 0; i < cartAndDetailDto.cartDetail.length; i++) {
        //     console.log('cartDetail[' + i + '].medicine');
        //     console.log(error.error['cartDetail[' + i + '].medicine']);
        //     if (error.error['cartDetail[' + i + '].medicine'] != undefined ||
        //       error.error['cartDetail[' + i + '].medicine'] != null) {
        //       this.medicineErrorArray.push(error.error['cartDetail[' + i + '].medicine']);
        //     }
        //     this.openModal();
        //   }
      });
    }
  }

  showMessage(itemName: string,) {
    this.toastrService.success('Đã thêm thành công ' + itemName + ' vào giỏ hàng', 'Thông báo', {
      timeOut: 2000,
      progressBar: true,
    });
  }

  showMessageError(medicineName: string) {
    this.toastrService.warning('Thuốc ' + medicineName + ' đã hết hàng', 'Thông báo', {
      timeOut: 2000,
      progressBar: true,
    });
  }
}
