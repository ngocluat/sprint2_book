import {Component, OnInit} from '@angular/core';
import {OwlOptions} from 'ngx-owl-carousel-o';
import {BookService} from '../../service/book.service';
import {ActivatedRoute, Router, UrlSegment} from '@angular/router';
import {ToastrService} from 'ngx-toastr';
import {CartService} from '../../service/cart.service';
import {Title} from '@angular/platform-browser';
import {BookDto} from '../../model/BookDto';

const MAXIMUM_QUANTITY_ALLOWED = 20;

@Component({
  selector: 'app-book-detail',
  templateUrl: './book-detail.component.html',
  styleUrls: ['./book-detail.component.css']
})
export class BookDetailComponent implements OnInit {
  discount: number;
  bookId: number;
  book: BookDto;
  relativeBookList: BookDto[];
  quantity = 1;

  constructor(private bookService: BookService,
              private route: Router,
              private toastr: ToastrService,
              private cartService: CartService,
              private title: Title,
              private activatedRoute: ActivatedRoute) {
    scrollBy(0, 0);
  }

  ngOnInit(): void {
    this.activatedRoute.url.subscribe((s: UrlSegment[]) => {
      this.quantity = 1;
      this.bookId = Number(s[s.length - 1].path);
      this.bookService.findBookById(this.bookId).subscribe(
        book => {
          console.log(book);
          this.book = book;
          this.discount = Number(this.book.discount.percent);
          this.title.setTitle(`${this.book.name}`);
          this.scrollToTopOfScrollable();
        }, err => {
          this.route.navigateByUrl('not-found');
        }
      );
      this.bookService.getTop10RelativeBook(this.bookId).subscribe(
        data => {
          console.log(data);
          this.relativeBookList = data;
        }, () => {
          this.relativeBookList = [];
        }
      );
    });
  }

  customOptions: OwlOptions = {
    loop: false,
    mouseDrag: true,
    touchDrag: true,
    pullDrag: true,
    dots: true,
    // autoplay: true,
    // autoplayTimeout: 1000,
    navSpeed: 700,
    navText: ['<i class="fa fa-caret-left"/>', '<i class="fa fa-caret-right"/>'],
    responsive: {
      0: {
        items: 1
      },
      400: {
        items: 3
      },
      740: {
        items: 5
      },
      940: {
        items: 5
      }
    },
    nav: true
  };

  scrollToTopOfScrollable() {
    window.scrollBy(0, -window.innerHeight);
  }

  decreaseQuantity() {
    this.quantity--;
    if (this.quantity < 1) {
      this.quantity = 1;
    }
  }

  increaseQuantity() {
    this.quantity++;
    if (this.quantity > MAXIMUM_QUANTITY_ALLOWED) {
      this.quantity = MAXIMUM_QUANTITY_ALLOWED;
      this.toastr.warning(
        `Bạn chỉ được mua tối đa ${MAXIMUM_QUANTITY_ALLOWED} sản phảm`,
        '',
        {
          timeOut: 2000,
          progressBar: true,
        });
    } else if (this.quantity > this.book.quantity) {
      this.quantity = this.book.quantity;
      this.toastr.warning(
        `Số lượng sản phảm còn lại không đủ`,
        '',
        {
          timeOut: 2000,
          progressBar: true,
        });
    }
  }

  addItemToCart() {
    this.cartService.addToCart(this.book, this.quantity);
    this.toastr.success(`Thêm thành công ${this.quantity} sản phẩm vào giỏ hàng`, '', {
      timeOut: 3000,
      progressBar: true,
    });
    this.quantity = 1;
  }

  buyNow() {
    this.cartService.addToCart(this.book, 1);
    this.route.navigateByUrl('cart');
  }
}
