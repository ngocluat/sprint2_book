import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {OwlOptions} from 'ngx-owl-carousel-o';
import {BookService} from '../../service/book.service';
import {BookDto} from '../../model/BookDto';
import {ToastrService} from 'ngx-toastr';
import {CartService} from '../../service/cart.service';

declare let isotope: any;

@Component({
  selector: 'app-home-page',
  templateUrl: './home-page.component.html',
  styleUrls: ['./home-page.component.css']
})
export class HomePageComponent implements OnInit {
  bookList: BookDto[];
  currentPage: number;
  totalPages: number;
  sort: string = 'releaseDESC';
  name: string = '';
  @ViewChild('search') searchInput: ElementRef;

  constructor(private bookService: BookService,
              private cartService: CartService,
              private toastrService: ToastrService) {
    scrollBy(0, 0);
  }

  ngOnInit(): void {
    this.getAllBook({page: 0, size: 8});
    new isotope();
  }

  getAllBook(request) {
    return this.bookService.getAll(request).subscribe(data => {
      this.bookList = data['content'];
      this.currentPage = data['number'];
      this.totalPages = data['totalPages'];
    }, () => {
      this.bookList = [];
    });
  }


  customOptions: OwlOptions = {
    loop: false,
    mouseDrag: true,
    touchDrag: true,
    pullDrag: true,
    dots: true,
    // autoplay: true,
    // autoplayTimeout: 800,
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

  sortBooks(sort: HTMLSelectElement) {
    this.sort = sort.value;
    this.getAllBook({page: 0, size: 8, name: this.name, sort: this.sort});

  }

  previousPage() {
    const request = {};
    if ((this.currentPage) > 0) {
      request['page'] = this.currentPage - 1;
      request['size'] = 8;
      request['name'] = this.name;
      request['sort'] = this.sort;
      this.getAllBook(request);
    }
  }

  nextPage() {
    const request = {};
    if ((this.currentPage + 1) < this.totalPages) {
      request['page'] = this.currentPage + 1;
      request['size'] = 8;
      request['name'] = this.name;
      request['sort'] = this.sort;
      this.getAllBook(request);
    }
  }

  searchingBook(search: HTMLInputElement | HTMLSelectElement) {
    this.name = search.value;
    this.getAllBook({page: 0, size: 8, name: this.name, sort: this.sort});
  }

  addToCart(item: BookDto, $event) {
    if (item.quantity > 0) {
      this.cartService.addToCart(item, 1);
      this.showMessageSuccess(item.name);
    } else {
      this.showMessageError(item.name);
    }
    $event.preventDefault();
  }

  showMessageSuccess(itemName: string) {
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

  resetSearch() {
    this.searchInput.nativeElement.value = '';
    this.getAllBook({page: 0, size: 8});
  }
}
