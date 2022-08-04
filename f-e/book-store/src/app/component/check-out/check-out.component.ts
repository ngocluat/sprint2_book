import {Component, OnInit} from '@angular/core';
import {ICreateOrderRequest, IPayPalConfig} from 'ngx-paypal';
import {Router} from '@angular/router';
import {CheckOutService} from '../../service/check-out.service';
import {CartService} from '../../service/cart.service';
import {ToastrService} from 'ngx-toastr';
import {NgxSpinnerService} from 'ngx-spinner';
import {CartAndDetailDto} from '../../model/CartAndDetailDto';
import {Customer} from '../../model/Customer';

@Component({
  selector: 'app-check-out',
  templateUrl: './check-out.component.html',
  styleUrls: ['./check-out.component.css']
})

export class CheckOutComponent implements OnInit {
  cartAndDetailDto = {} as CartAndDetailDto;
  customer = {} as Customer;
  public payPalConfig : IPayPalConfig;
  rate = 23315;
  totalUSD: string;
  isSuccess = false;
  isError = false;

  constructor(private route: Router,
              private checkOutService: CheckOutService,
              private cartService: CartService,
              private spinner: NgxSpinnerService,
              private toastr: ToastrService) {
  }

  ngOnInit(): void {
    this.checkOutService.getCartAndDetail().subscribe(value => {
      this.cartAndDetailDto = value;
      if (this.cartAndDetailDto.customer != null) {
        this.customer = this.cartAndDetailDto.customer;
      }
      this.initConfig();
    });
  }

  private initConfig(): void {

    this.payPalConfig = {
      currency: 'USD',
      clientId: 'AYEhWF15yjs4kqngtEVpTs3wSAwNJKlg-XFf7Dogm9sHO3qzuXjKjvEK7O7m-aCx-83wAH91ABiEqkZ-',
      createOrderOnClient: (data) => <ICreateOrderRequest> {
        intent: 'CAPTURE',
        purchase_units: [{
          amount: {
            currency_code: 'USD',
            value: this.totalUSD,
            breakdown: {
              item_total: {
                currency_code: 'USD',
                value: this.totalUSD
              }
            }
          },
          items: [{
            name: 'product 1',
            quantity: '1',
            unit_amount: {
              currency_code: 'USD',
              value: this.totalUSD,
            },
          }]
        }]
      },
      advanced: {
        commit: 'true',
        extraQueryParams: [{name: 'disable-funding', value: 'credit,card'}]
      },
      style: {
        label: 'pay',
        shape: 'pill',
        layout: 'vertical',
      },
      onApprove: (data, actions) => {
        this.spinner.show();
        console.log('onApprove - transaction was approved, but not authorized', data, actions);
        actions.order.get().then(details => {
          console.log('onApprove - you can get full order details inside onApprove: ', details);
        });
      },
      onClientAuthorization: (data) => {
        console.log('onClientAuthorization - you should probably inform your server about completed transaction at this point', data);
        this.checkOutService.saveCartAndDetailAPI(this.cartAndDetailDto).subscribe(data => {
          this.cartAndDetailDto = {};
          this.isSuccess = true;
          this.isError = false;
          this.cartService.clearCart();
          this.spinner.hide();
          this.showMessageSuccess();
          this.route.navigate(['']).then();
        });
      },
      onCancel: (data, actions) => {
        console.log('OnCancel', data, actions);
      },
      onError: err => {
        console.log('OnError', err);
        this.isSuccess = false;
        this.isError = true;
        this.openModal();
      },
      onClick: (data, actions) => {
        this.changeRate();
        console.log('onClick', data, actions);
      }
    };
  }

  openModal() {
    document.getElementById('buttonModal').click();
  }

  returnHome() {
    this.route.navigate(['']).then();
  }

  changeRate() {
    this.totalUSD = (this.cartAndDetailDto.total / this.rate).toFixed(2);
  }
  showMessageSuccess() {
    this.toastr.success('Thanh toán đơn hàng thành công', 'Thanh toán thành công', {
      timeOut: 2000,
      progressBar: true,
    });
  }
}
