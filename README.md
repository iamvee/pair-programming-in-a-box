# Pair Programming in a Box

## استفاده از ایمیج داکر `pair`

برای ایجاد یک محیط کدنویسی و به اشتراک گذاری آن با بقیه، یک سرور ران می‌کنیم. داکر فایلی که در این ریپوزیتوری می‌بینید،‌ایمیج سرور است. 

### ساخت ایمیج سرور

```shell
$ docker build -t pair
```

### راه‌اندازی و استارت سرور

```shell
$ docker run -p 8080:22 -dt pair
```

### برای اتصال کلاینت‌ها به سرور از طریق اس‌اس‌اچ

```shell
$ ssh -X -p 8080 root@<your-machine-ip>
```

پس از راه‌اندازی سرور و اتصال کلاینت‌ها، چه ابزار‌هایی خواهیم داشت؟

| . | نام | توضیح | 
| :--:  | --: | :-- | 
| 1.  | emacs | a shared emacsclient session with all connected users | 
| 2.  | terminal | a shared terminal session via tmux |


## ابزار‌های تکمیلی (سرویس‌های آنلاین)

### سایت‌های کدنویسی اشتراکی 

* [codeshare.io](https://codeshare.io)
* موارد بیشتر

### تخته سیاه اشتراکی 

* [witeboard](https://witeboard.com/)
* [realtimeboard](http://realtimeboard.com/)
* [Google's Jamboard](https://jamboard.google.com/) : دسترسی به جم‌بورد گوگل راحته، با بقیه ابزار‌های گوگلی هم لینک می‌شه

