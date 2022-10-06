{
  config,
  lib,
  ...
}: let
  joergsKeys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKbBp2dH2X3dcU1zh+xW3ZsdYROKpJd3n13ssOP092qE joerg@turingmachine"];

  redhaKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOb4/IcT/Ly2VjmhO8PhSlsBSziL3Yn7nTqoPrzRJ/FHHUfEZhUj0cx8h++wKas8Y6FELP0a121Hkki4L/QIhzd6zcTlqVQ19EX98KMmD9PsGlK5tdPV7+bjNLCtEXjqPIEYUi/cL/kvuKpMwLyzkVTyl5AFRvR9TQkITfHChWCV9KfKTFjM+h/FBQvH3zrjbpGbMiS7bclRL5Gvih3eOHSuQSrJurgkPr8cH1z47L8rqTlEwJ+9x54fQo2wbJm41BFcdY7qONSmtMI45EfFB3K7MdpH1ztg25l7K4ctgHayRASNI7IMIzijibd1acf08OutRec0XLLNGvCcKyW1EV redha@redha-Lenovo-U41-70"
  ];

  sandroKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKqNR2tsYH2igXjgiOA/yc3CdXqpg70ViICdGk/Acmxu"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIb3uuMqE/xSJ7WL/XpJ6QOj4aSmh0Ga+GtmJl3CDvljGuIeGCKh7YAoqZAi051k5j6ZWowDrcWYHIOU+h0eZCesgCf+CvunlXeUz6XShVMjyZo87f2JPs2Hpb+u/ieLx4wGQvo/Zw89pOly/vqpaX9ZwyIR+U81IAVrHIhqmrTitp+2FwggtaY4FtD6WIyf1hPtrrDecX8iDhnHHuGhATr8etMLwdwQ2kIBx5BBgCoiuW7wXnLUBBVYeO3II957XP/yU82c+DjSVJtejODmRAM/3rk+B7pdF5ShRVVFyB6JJR+Qd1g8iSH+2QXLUy3NM2LN5u5p2oTjUOzoEPWZo7lykZzmIWd/5hjTW9YiHC+A8xsCxQqs87D9HK9hLA6udZ6CGkq4hG/6wFwNjSMnv30IcHZzx6IBihNGbrisrJhLxEiKWpMKYgeemhIirefXA6UxVfiwHg3gJ8BlEBsj0tl/HVARifR2y336YINEn8AsHGhwrPTBFOnBTmfA/VnP1NlWHzXCfVimP6YVvdoGCCnAwvFuJ+ZuxmZ3UzBb2TenZZOzwzV0sUzZk0D1CaSBFJUU3oZNOkDIM6z5lIZgzsyKwb38S8Vs3HYE+Dqpkfsl4yeU5ldc6DwrlVwuSIa4vVus4eWD3gDGFrx98yaqOx17pc4CC9KXk/2TjtJY5xmQ== lassulus"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDB0d0JA20Vqn7I4lCte6Ne2EOmLZyMJyS9yIKJYXNLjbLwkQ4AYoQKantPBkTxR75M09E7d3j5heuWnCjWH45TrfQfe1EOSSC3ppCI6C6aIVlaNs+KhAYZS0m2Y8WkKn+TT5JLEa8yybYVN/RlZPOilpj/1QgjU6CQK+eJ1k/kK+QFXcwN82GDVh5kbTVcKUNp2tiyxFA+z9LY0xFDg/JHif2ROpjJVLQBJ+YPuOXZN5LDnVcuyLWKThjxy5srQ8iDjoxBg7dwLHjby5Mv41K4W61Gq6xM53gDEgfXk4cQhJnmx7jA/pUnsn2ZQDeww3hcc7vRf8soogXXz2KC9maiq0M/svaATsa9Ul4hrKnqPZP9Q8ScSEAUX+VI+x54iWrnW0p/yqBiRAzwsczdPzaQroUFTBxrq8R/n5TFdSHRMX7fYNOeVMjhfNca/gtfw9dYBVquCvuqUuFiRc0I7yK44rrMjjVQRcAbw6F8O7+04qWCmaJ8MPlmApwu2c05VMv9hiJo5p6PnzterRSLCqF6rIdhSnuOwrUIt1s/V+EEZXHCwSaNLaQJnYL0H9YjaIuGz4c8kVzxw4c0B6nl+hqW5y5/B2cuHiumnlRIDKOIzlv8ufhh21iN7QpIsPizahPezGoT1XqvzeXfH4qryo8O4yTN/PWoA+f7o9POU7L6hQ== qubasa"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/3nkqxe8YrDVt615n96A7iC3vvwsiqgpsBYC/bhwfBHu1bAtBmTWVqSKDIdwg7p8TQpIKtAgZ3IJT3BlrnVTeR4RIviLjHjYWW1NBhm+nXi+heThgi5fLciE3lVLVsy5X9Kc1ZPLgLa1In0REOanwbueOD0ESN1yKIDwUUdczw/o3dLDMzanqFHKuSSN4o9Ex2x+MRj9eLsb706s4VSYMo3lirRCJeAOGv1C7Xg1cuepdhIeJsq9aF7vSy15c0nCkWwr8zdY7pbMPYCe5zvIEymZ0UowZ5HQ3NmIZnYDxa4E1PFjDczHdQbVmmGMI80grNwMsHzQ6bynHSPXDoLf4WodXlhS0+9Ju5QavDT6uqZ9uhDBuWC8QNgWUMIJnEaTBFyA0OI1akl8Q2RLC+qnNf5IwItSq+GDwEsB2ZJNW3kOk1kNiCUrBafRYpPaFeP97wzzP4uYlBKAr2SOLrrkf7NFEdw2ihxhDMNnps/ErRJ8U0zdpmalw8mItGyqRULpHjk/wN00rYOdBIhW3G3QJuVgtGnWtGCBG5x70EfMiSEXPD3YSsVVsgKD+v8qr+YiilRRD+N3gaHhiOWA6HgxRNul/P4llk0ktTpb9LoHk2+oooTH5ZuuT/8yF8J4stZt7EIOH+mSOAXG1z0BwnEkQu7pVKwu/oOZpGJTvBrGwww== tv@xu"
  ];

  mauriceKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH756wA1zmO+FWP1/WJTwezIxBmDQp5ocS5kyA8jqLRv"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6WLnXEyW0Q2xvuvlBwp27LPljmmR0goCxKLhUHK9ljlYKwj4Nrij7ps0AgxDbWWrkeJVTVuD2e/R7dRnYlH2BpUmYJwOP3PKCkpVJ+XWTYKpkHUyHJNwhPPwGIsxiuOSdyrsv5YwbpwFTf8+BllZwThX/zMNLqtMz6FzYiWkLncQBE3ZB/6uQypLHfPb1Y57nmmsV+FzztrorgWDrG5lVp0x3kqCx2l2sPflhLJiW/3TuRRlLZecmE0pP1gv20j+NTfXiYivx4Cq1rdgkYFBAE7BG0j1PY49oZE9FF0pyWd+Fgrzrz2DG7HECPL37EO+M8nw10zBnD6GXniH0DsiMivz6mNZCm0CZ5TZQAJebx2hXXzFQYE7RL0O4+k4CA2RCvpctBpcBHS7RLSoCGpF9IkYUCRGsyy7YKTcXA94XKkNBr+zbT6emCnUG+0hyubgNHW2jEEXRhRKGkrBDeq1rXx+T7xr1QyLAbEDYFsFFq8tS8P3wE5q1Oy8drPZjEME= maurice@rose"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJztEu9h7WhURwMpThDdjBIIPPeEtpSBv1TUFPpyujTa"
  ];

  atsushiKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDuPk8qYR8pJkAZmG6d+Jh0dJwDx2FuVThZJGI00Djk1mD6qQD0NIAFv29v9nvOX9u5wpMTVAbdC0RMqrmTAgYwJ/kpFe7+Tjr7v/Oi1AlaseBpSOCdAQcmtFdza2y5f0D1AnFuRBTKvdY8ACYbnPhKCqcVH8/9EXYe6UVZQv2Gcdllc7LcZiP/g8bMhF+FB7qOzPFPOCapqMzX0lIEvtaxJb4s9pLWXJJQkIK15IQT8UuB7W3JBQO0+5VMwLpMAPcnVgn/nhTRbytngbbZWyuETmh5XuhI4KX49KC4qrW823Ujf3XXV65QYb5XI/n8Dr6481u2TLRIXkDz5wVTV2Kd atsushi@koshiba-mac.local"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrh1vZu6iNxesJ3zu2K8LYkr+yuvx6gR4SabKp6R5aMjr/qlccpcwBMPqEV+/piHyiZ131Mki7LYLRBCnxwoZ0DTI4j9WMZ4zI2luN9pQGraN6Of+es+mx/XRpcRI4oVmXXzA1n1f+PpGGz0JVx4jq3NbuMbbgv2CgoS9AbErqY1nDfEfcbquj6KiMi3jUckZZ51qKNAWBxvqNV1pIWdLsbxJnIjRaAJ/P2fQHvsyPSYiyh4gwUj8eNyFiU7Ko3JnRHTXCbwx7FTYAp73Ga2w7ZgW4Yt70wiZEiAOthjQj+moT1TfbQF+4tfYS8/jcDMyPBlOTsw6EzS7LWHyR08xP atsushi@atsushi-vb"
  ];

  dimitraKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUXap/inau3PgwfwwzA/xgjPFwMIDNlNlQ6FDPxUS1bFxvLUewLlP7tHEjlU4aCe5/KPqtbnEOuU3ZBRBPiGAXA1WxIofQH4GLD9kUoxQXk3n9budu7Ni0Mc7fk4B4yKA6hAxdy78FDbWyJe7UMYhFvDJs9+A7HnxishLKrea3LjDVxW/2dhpIDOj7jKDJKh56m8WQn7Msb1w02f7o0J46EA49y1hlJFuGjLHSYwx5O7flFh2tyKiARDuriqp64rSLONWXmOWDX8d+JcnIZJGrMXxTWIuuqxkdsw0tvi7g/msDQrn8DVGX2sRxoGYksKMrMhYAAAoLiwH0Zi2777DZ demy@ubuntu"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDkFay+8y99fYWHXCn3JJG+iuA9UN4oEdUD2l4C5oyE+j9gIpc1m4TzNYOmBHmvZRKKwhrHKr8ORHdtm26+iQCkV2j5/AuununfsuXr/pL+Zmm+muKgVPdtturCEEa5uzfEiuFHa2BiwW4FarBu1pC/Oc35R8NOByDAPe190iOS4kf1JhlhbOjUHjf7b823FwDfqAteNVINyNoIBWG/yJBv9Xzlr62G2DNkUo9VLreANCgTwuLwP1q3gxavlUNIDsZYJ+k1TdjB0OK1T7MgCvz4gUIjLadYgnMi9qGeq5eiJxmcK1VUDenlY1rzKpTbt3pZwgFO9OX4OxGWczCSbKImi0UdpbsMoVnIHm6xe2Y+c54/AgeVztsWeD4L9PArrdjBaXkcy/ALs+xNhQEJgPZifU6PkL9c1PP++n7IozLZSTHex2WdXAqxsXTeEuE7ldpzAQL5Hnj3qsaIcdrccd9iWslfSBnWxFjqE3+bPe71I+1c1sdI0hP7OGQng+8ReKS6hL7LkzsJlDfI6k/WUg299K4Xq/ljqE7rT9K6/qxe8E2bBvo18DhgZ0WhPuwsDpGyZm9DwnYDN8Xuv5QutzPYyuGmm65YNjJ9I7Dhq4npKXVtZGZI/46KsvDqr6StLKyCNZywxdMFW3FN01+QWtRWNPCBJlYTE3r1pveEkM26Q== demy@ubuntu"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAZ8RRWQz/Sy8L+H6eUQJOROlV733U/Ir32SaQP+rLrQGfkqE3oguRDtHfj6NEA98q7eaQDx9v57EUpHe9rTDDF/JSjoOsbWEF90M7mMTqBjFAb742pB/CVOplyhnniZh22vruu+GC6hBjd4cg9Qw6IPueZLB4f1nkXSCboW0YY3I4Gaq9DFlk2Gi8G1VQv1tYa5+6i9eOEW/+h2VUQkHtCbNYFnt/5wlsTkP6Gh6MeBRkrUQMOgNmYfJhPtE0ZLTkrTs7BZCW5i5CE68kXyYWh2WHLKM1Z3vw1SA2MuEpQPdoKRwpiQf+ZoWeciVd9+1RXcS7PAWcOJg854I9RyRhDlErAS1ENmO3ivqEYo2FNd+Sin+/uvG0c8IJONJMZyWOnaLb+dLfV0/0EdAo1htFLFefp83DtK9r1QcYoFgAL7kwYk9Ox4R9CDt3y/UueMbmWC3W+jSyUm03LZJkJa0tXkKE0cZYcajoH2cdSWjZdUbhr00jBjzJoovGb1tKw2k= dimitra@rose"
  ];

  dimitriosKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8PDKvdmcJIyd5C7XfCEKXQdbVv8f1sy3+/jl0EEyQA17xVU00lR9my36QLk9R6YKRo1EF2CHf9jNrQ6q3+cZJJEX4uv0gdicYiISy9+aPBAOEiQ6bfatxQmYMXOwv3Hv7EP5rEmPPCwFR8neLQEAvXjY/yucIeyAPqKFNU73OH8rqR++AmUQGAi7LGCVTYYQQ+uTBHR5H7YcvyzElDgGBWgxWJRzU+hm410BjItHYtP51dQejqKLGWCqp6r3slgWdZ9Lg/tytv5fzl19JiOV61TQ83hmgtsdXn7pgzp9OFAOXClYm0P6DwMdO/bRDp003zzO6/jS1Hphi4gvYxnrXlEFebzqLG6AMhoR6BUgPSUmQQZFedxxQC6WAGrSt2loZp739Tf1vJtF4Ep+WRb/DITss1VRYYxjPExgETM7BGqVICEdrqkM+aERxUbkfy2HbFdzP1J4P3wXGFuKtBUuEyvmT4eE4D+Zlfh7lhGw3IXkNj+YEeLigGnqVACvCUqa3HyLNwXB/4m4GRN5/noEi5I8VKgTxdrycRdSsBd4gNIOf0QjtVAD6CGkmWQURh28GD4Plyaz+H8BAsaWuH3aX4wIyV6+6rfPyO5T5rgIMxJkYoD6lWupwY1qO36KSC7A4sS0HcAPR16EZghMcMC4FNy4PGLIlUuwJ7KJd0Ptlyw== dimitrios.stavrakakis@hotmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGaFuDu8EM/hA5UtAc3Q+0zXvRcwT6P6TZhtps/3R518 dimstav23@Spam"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDafd2SX0Mi6kiKXNaSYmMO71dFIVbBGLpaMt/MO4uzoX8rihtud4CIbCXm8iO+I/p7c8e5lfkyJbnmJsXS6VfkohP4K36V0r0ZQhXhU01KpgC86z8uAnPGowuvGQGseMPG5lR5qAC4keENx1wiIn+fP5N7xUNVQTLc9KKNswLYwzEj6hRvI+ZoUybNuEieqb251vcFzGGZ/+i8PyEJ8xhxql91QtmxKHeZTn1ogbr1AAlWFESnhvxY1ky48BKKAKSD9kEXB+iszjd6a2DvilD0C60b9yPeSRsKVAXhuy+/swcFs0ly5KV3FNWDKV9KGJP1aaRSgX0RE6C5MCdbjARv dimstav23@Spam"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOtq2p1WbvKsV63p1+GhgfDxMmN3dFUL+IM1/HcWSqJ dimstav23@gmail.com"
  ];

  harshanavkisKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCk5NDpY5ZdeUZl1jwiPuUgDad9i9oKxq2Ocm/P2Nf6SVMgl6aaiWEPzS7QfkZpOCqwtBqnBdUoykvQ8RwGCBoA7H9KiV0laqZFIbdNmiFKhZX4KQk8WVVxBlVgUIpLfp1eN7iu1PX0shO7/+zkObF2lAP2XMWpPOanfB1sHS2Um4AdEaYo+4QlUdrBS3WwBDLnuZdsG6B3CfAfVdj+zuJALnKdd/p+HUzDKD031SFGYUT7pzvsOVkmrvNbSv3l2dbVUKVjC7NDTMb3tk0iIGT5RdyYNth6mdR4EgtjNl+vZqWiM/1wRoY7SZ1gmSaXkgNNU3DM9tU7IHc0JFGXjRCxdNVy8EuxZ0f/szvVt9RyuCizkpJ6WJBKjqX651uDLxNJ4FV2qTK4jBANKpWVt5J4BIjCeIOCTSsRoW61WSefQy2LovHr/1B9/vmYsOsicYOd41lcCjJ1AuHIY6HzYS7nvxaFHoC0hvxJsFgCxHUHjDqjfuRaiBthtZu/2cRWcJybYWmsfRn7cKPKFNo7VscC1Hu0YVyKQMxyzq1y9lC54IXjoFrnkicUYYLA6jU5qwoadvPqCSnGfOZBKSW1gFOZYfGKlf0u/CDCqdm1IfVGXQwONzJaELhpmV9bcING0cXLs+XfLe5kPhg7vXb8qHTgC37Jtodf/+s3M4SbW7WA4w== hvub@hack-haven"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCY1+b1HIuJ4hy+NMst9qjJmBCY9Zyk8rrZlUyXGy0ll06kLwUiDNzcKUuKFH1y3zsn+1yGZFFjZUWi4mnpyNWSkSsQ1HJcuz2bFLw+5UyF42K+HPyeq6SE7xZcZ/cEE508Mqms/hIjl+tffRtoA2jxDZNdEjk9Qq/gzuYJo0b13bqpDRnrU1vUIk7egw4XOU29Wl7tpdKiESf6fow+Hi71BoLUeBjtJp6lRr/oqmpxPcFgI4BQD61VuPH3BeQIlZl8TWmqiZ+XjOHxxqkDCH+f4ZdM++P1p8kIkhz8wZ3ajNIbJFnqCxOBkd/zTNLnKCmZafW0SlIm1rLh8W1na97wKJCGCPjTVzrq5dVTG6sEApuBx1kTk3Ir44V78CwkN2X0bTJmWyj/5QxF5cEbKlkP9UKmSFiDlk5/nnxPsWkNhIzyaEMTP/pZFWgAK1aWXwh9/kLn/YSTjKs5BhIjEw4EuFybWgiNzn2Cy38Ir5oR1XA+vmS0flti4K9eHWGzjxGcSb53jOcqWdILiTV0iPq+0H1mUCr5ZIUGF06FBjdEkpxlmg9PsTdf/uIkvkicYVQLUsG25oNZg+oOa0eJEuAqR48VSDvNwUn2sbaX22J22eQFEkaqgr+W6oGOny87Ig6fFglNNWQeLOS/mJ8HKnRS2rkxu2i6VYwLZIulVGpS7Q== hvub@TUM-Thinkpad"
  ];

  irisKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDS5MBL3BDvTOlO0baxN9sXeo0fjhCA8U71sSMLwWCNx6Y/L+aMXRQrimnu7K1x7oM/BuV7IzAosV2lZe7mnD2Lvs9kzWe8KwNR9m9fUV54PTqR6Yjg+f13JB1/KGWd1SmyCOGXXZCG5K3HJqK5Rju4VhlJUEGRQ3dl2bV1l9E8hyHNL0CQWKbIMDbHv19vMtAqEfIHCDqFkf7+gO7Fx5/EJ+2Tt3s6xTx4tse+0k6R2KcwOB/ArlUEN8ye4jO4/sNcyAzY7z8OukuDB4ky2TxJp2C0ljWpkUIcAk4eOS8MXKMy5OSfA7ev+PdpI2lYw3VhH112bZZ3XqW16YNCj6Xf iriditsa@trypokarydos"
  ];

  mjnamKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9B7L8nxes3S4NekAKKGYl0DTrtWcak/Cznk60FxrQeEeMW3X3O/TNx++keMBfTpi+crzVbFvpJQxAsG3CsWTMK3OrW9HJJvDajQqgd3YJt43cn++EVBk6JQK/J08mvKz5/dFx8W7mfg5IljP1LMjbTJLEOy/slJjXIfuVt4Fvb5v2uqVvbzqRyIIACCJhlKeM1mnYsT0OItPq8cinUZrb5haxCuSRywgpjwnxuOZff4m8x5EkYJ1X2kKgAm8VbVpTHqQJ2d0tBmNkHw52m7hD1dvAUDbTC2Fum10cyrCX1Fw2y+a8br2Wc1wipkzZI3Vm83LKSNaBxuRQ3YXf8+J8RjmXY85f920IblVBEkVZnG5xDadVrX/neBX8e/tYL/V86LKvZMvEYV0Yq0IR4op04kyFhdpGD2IEMu4aAKH2wtAgrpaz+3T/xrS9Sg1ZKSEqOSX1kOvbVXLUCxPFqqk8eibQGsIo3pyplOvCNJVTKkO25ss4W77xq10YCUu6T90= poolmoo@Jin-X13-linux"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCavNkgsOAT2DzG/KEphfE0Mi3ymBm5ChvWiN5CPYiTs4Ygsf1eBN1KS4x57pPHG04XYOwRnhYq3LgWsbo/Cg8q1plBHGN1DJhLjhrxCQhan3zqhj7iOaDLPawEiupuUQ6D4cMzdlTHEK7iGyfq7pe84KBfW2l/PyQ6Dt92bxPgOut3x7/iVhhm03AQ2JQYwSp/ALrKnrHeT0yxk+vKkvKlMKhDf847XTRiwDHbq/d2oD0Tx6DntwfMte0Yi1UvCgAHos7nbgiXnr1zYdqrg5/daFXFr9tuPCEOEqhkHTe4EIgfnAXycBnFhGSlJFtkPOpvRIzF3YpIoyJ6vpS0t6w9f15zzXtk2Hy+ZmwhlhFI+dXl5QQ10samtD1ctuxSSWSbrc+50NCf1QfNxk+MQnGzEZT7JYZk3kra/hO/VNNBa8FA65vkZyaxzbhYM+a+81rXSRN20vMyF7h0vkHQUCMzqIQWRD1PAh+5AvBgUoruijkKrWIiNgCgP/TGMzUObD8= poolmoo@Jin-ThinkPad-T15g-Gen-1"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC74LFHC5DMUPeELPqYTw6ojXkAHyIJ2lDyw8hRZ8oiK3KCWLuVg0vVRzu/YE7PcZbYg1zgHK9D/S8IYRubUNYDla+R1OW096byPmAN7By5zQoJWlFQKr2+CF9jWIOe5QDULP9swkPEGHewWuz0AasZuvBuNm08GqPjtKFahrOn4nAZskMqmYSQqrHFPr4ulprvktjQnpsCAmSCO2d+KYK3z5n6E7FYtz3yR3rz4Zu0CkEDz/m6AWNtmt/Xg29HvpN+A1TtkTBfbFql4ppuXAl+Qb2hwRnfaMe/1B5SpVKVzqpFztrk4Il14U+T9Gx+UuJVONtv2unt7jiUkfKC5mncNhF/xAbon5MrLae/1V7LIuuVl4pKSZhH2Gi9z2/sK4HIjry3Sb/FpXYe6t1jfR4hHYEKB2zGfP+Iq2J1TrJTSIo7GB4cDoPXHXMt2HbBgB6xMx0R+X8Ugdj4cM7RMdUYrMrGOs8MWbWUtZHCyaay4zYIq6p2EL6kCl5Iteb49xs="
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkPxcg1xUoA5xU2r0j5qsweBsQyZO4wtojTUUuDLa+NJuzL4WtISiYfkkAyPR9Bzg1mtyJHVV6rcJ9cwgN6uWl0fM0Nmxr4y1E+aLCp1nDIiTxt3e8bsCTzqdDpVjlNw4jXz+qY6/JoAFtoc0Ti2zRRAFYXAGOkQLAqKgIROtF0QswhteQ+s1BU5Ts7evr5y78LOB2wZOCU8bNerT15M/v+n37LzYaCupatB/sdZ0cploT1bHP44hNnFd5d38WIOFpoE4pfvBC5paBjE6qSc7RogsFukhYGhHgCLsvLL89gliBZ49xW8Md+g89lckZ0gIeoFPvsKe85A7Lvz5WxkzF"
  ];

  okelmannKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDITBcN9iw5Fn7yyfgiWFet3QWDoMcUNtzLi+PNoYS7jksvcKZy5pLOjE6wCpkbYx+Tcb4MyvoWPXvwdo5FfL4XdhZRO+JlZ66p/rGssq/wEr2BBUwohP7o39JLtiyXGXSsK6MO2aceOFLQr4KAdaeD8ST0XumGcV6bGqIbjFsK5FCxFhO8NkCFtavBjDwKUm3uyOnVCWMp12abUphzxrVtWhcsnw5GapohATP03mCNxmrn/L7x393HutxgjyduScX7++MjwVE6J7wCnztPUtJbh9jYemr/K9fBMBbLhQagOjrlQYGU5frgmLrPCRZusyg5HjWx6gJIxs/DskfgmW+V"
  ];

  ackxolotlKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIa2YRaVvN0qZ1OD1x1zHQMW7RZ5dBCCenHbb/AUV46H ackxolotl"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAoK64f9T/jZhetTKuUnfcTZRB0pY1qXr0fvxVG6hm61 macbook"
  ];

  chenjiyangKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDnFkSHWAPt8/MwZ/+IzBzTwBWLqYT9seZO9MI3JPfW3mMxz9BeuuTXVGDgHXePlNOiPV/bnjSnBHALzS1A6+z6qYBpVX1+pT2fPJRXGqDYqWL4aMjiQZvfJ9aUnKbTA4ivVsNpDbf2QlySZiZTYE4IFroo5xtMxvrYgbvfV1ZfywihJPnrX58ddB7begp+jCliqKtOoCNEclxsiRw0hsawhm9YSmn525u9bLwi2+mPAhi6nL1DtPTTZLGlkVPAg21El9PqiYWpjRXmAHrMMcZCQEaS3+TqJYXHoX1U8ShSZ0vtwgkpiIoFGyjqjPHWDcacVEYZxABTwTlBq74on3RB"
  ];

  cmainasKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/UeXK/s6ZU9cp05safmSmiQ+kwLacZcDipO4/3aEiYjkq6Nf9/OLINLhg0QbPhvXLwJRh7CuEBkWOSNQx+u5rcemHA8GnhVIfWCoUSMEiZma4W3DvkzuLSxmaT9LZGZGOZkHJV6uNF1QnVeOyD0oafXiivVMow6Rr/HLIruvHfaM2xxj2EJsRdkXHHyBveXc44l/FAWfljU5DrpyLo03D4UI2Ko63MP02YLuNmZU2Rnb4LAPdFzJ6sGf1DX0UIabKvOBj/MJqzfZvRhmU3z2MuKDK97JbV2WiQhBm4NOd61Iid35nlODgRhL8CGArwrk86vufEtHndWy5DRwg0M7q/DvEYd7iNXDN8DKca+6UtQsNBTa8a5eOZuBvMAXsEWpBwKaIjpTVw9NeJd9Yt52Wj+LNRtChJJr5Z8UltC9TWFkyiJPNVfxuNhagW+OgmzK/LKXAGp2l+24U1ntBTdT9PONg2LWpxbfHGsYfhC4FWyE/HzJ5vSC6rGOdACjPYFFiAh5VsbLOTPrlF6Xu40Plm/BiFAE/Cr1n16LFu2sPe1PlKs+1pdhStTN0GzlV1y6VmFPmcYecpB/K7ZV0gJOe2ERqyb8yOqJp50evcwtzF3ZJKR9qRMjOXycOwdqigDU3+nCKHrWz6XwYkHUwLZ7ydJVDbzwT7rDlc871kRm7Nw=="
  ];

  masaKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIODydnvMp1+Ppx4J4IwXtnxwJhAVrFc4oRj5GEmimX8 masanori.misono@in.tum.de"
  ];

  sebastianKeys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDHQTf4Oz2eHoihkAXKpibIs+F7XUf7n28rL3kJXcQGlnar2xRLEwdWRxBrwKKdk092NVUTLXTFYopfIuJXFoJ8= sebastian@ThSt-I9"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFE6FC1RI5x+kb68QYg0RVAQvkH9Pz5Qmh9VZA9lRXlz/7A4SfV36oLaCwUKEpZv428fVcdc1ZFf69bLZKbyEGk= sebastian@A2003110405LEN1"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOxedj13JHRmts0X34Gs7FPDO4T3qEUw7Yu6TPufNLnvD8DlkUGyUKGQAuXd97pOfX5YOg+sI2NSk/1uBoZlW8U="
  ];

  matthiasKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDg/MON5ETxrOAcmxbnphJao1MxxeRIDDn7M6tMqERThU5gPumc2W/eAkWqXs/ZdgmMV9vBVdmZS4J++L2yLwWdcZcSeUC7lMdRMRW8i56ME6tOMymZIk0Z6p+BFFzgncOa+IFtx1QZ8Pl4Z8wfVNU9L5XY6lrfgoDjR40KgIpa4XZE1SiO2BbCsa2zhA1ZNCeOa6FEpK80BlA7Jw4pJ0w+Bl7UfGiOTkQ9idoygy7/B8Z48jSXgHPlOzxR1HyvG8QoNEGThK0o441DxVPfy4p9Q5HFqj2Wf1Vrxktoco6dpdNkuU89z5L/JsKfkbo9dBNRW6ICVus84rLUr6uFFyU39FahRtfJ7xsZjt2IVd2eY2nZWdJ2Pd7ytzzD+djJKsnDJXm96fh6qpjYHzDGPqLUkd86FGSpr3gbFvCprXkUDi8J5z/GkdAwNeqk9kUdYBEcGS5E3jciAxz4fmDGYhJ8O6gs9MRT947mWG1Q6+vOqcglxBUX+5w7LIb9bhUNLTs= mhille@mhilleWork"
    "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFbOAoiGH2iTed3lz9DGJu/+rDJnVrbuKGX741qsCu4XWvlbrzCugffFugPTfRyykTT0SWRyhWe2bVjAWP4k1OsDQB9d5JI3b0dETHYByksUs0SQyjg5JPMZnVtfxrtQhaPsrHc+bie+sUjC4FObn0YD1tQeY6RMK7gmN8F6X8rjoRvSQ== mhille@mhilleWork"
  ];
  
  martinklKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvQLwToitv9b0cZK2UNUh26BYJ8/ie8oexCyye+BpXP martin@kleppmann.com"
  ];

  extraGroups = ["wheel" "docker" "plugdev" "vboxusers" "adbusers" "input"];
in {
  options = {
    users.withSops = lib.mkOption {
      type = lib.types.bool;
      description = ''
        Wether to use sops to populate user secrets
      '';
      default = true;
    };
  };

  ## we put all bachelor/master students here
  imports = [
    ./students.nix
    ./reviewer-accounts.nix
    ./delete-users.nix
    ./whitelist-hosts.nix
  ];

  config = {
    users.users = {
      # Jörg Thalheim
      # tum/edinburgh
      joerg = {
        isNormalUser = true;
        home = "/home/joerg";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1000;
        openssh.authorizedKeys.keys = joergsKeys;
      };

      # Dimitra Giantsidi
      # edinburgh
      dimitra = {
        isNormalUser = true;
        home = "/home/dimitra";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1001;
        openssh.authorizedKeys.keys = dimitraKeys;
      };

      # Maurice Bailleu
      # edinburgh
      maurice = {
        isNormalUser = true;
        home = "/home/maurice";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1002;
        openssh.authorizedKeys.keys = mauriceKeys;
      };

      # Dimitris Stavrakakis
      # tum
      dimitrios = {
        isNormalUser = true;
        home = "/home/dimitrios";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1004;
        openssh.authorizedKeys.keys = dimitriosKeys;
      };

      # Harshavardhan Unnibhavi
      # tum
      harshanavkis = {
        isNormalUser = true;
        home = "/home/harshanavkis";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1005;
        openssh.authorizedKeys.keys = harshanavkisKeys;
      };

      # edinburgh
      # delete once we are finished with edinburgh...
      # uses edinburgh server as a ssh jump host
      iris = {
        isNormalUser = true;
        home = "/home/iris";
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1006;
        openssh.authorizedKeys.keys = irisKeys;
      };

      # Dresden
      # tests nixpkgs on our infra
      sandro = {
        isNormalUser = true;
        home = "/home/sandro";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1009;
        openssh.authorizedKeys.keys = sandroKeys;
      };

      # Redha Gouicem
      # tum
      redha = {
        isNormalUser = true;
        home = "/home/redha";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1010;
        openssh.authorizedKeys.keys = redhaKeys;
      };

      # Atsushi Koshiba
      # tum
      atsushi = {
        isNormalUser = true;
        home = "/home/atsushi";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1012;
        openssh.authorizedKeys.keys = atsushiKeys;
      };

      # Myoung Jin Nam
      # tum
      mjnam = {
        isNormalUser = true;
        home = "/home/mjnam";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1018;
        openssh.authorizedKeys.keys = mjnamKeys;
      };

      # Peter Okelmann
      # tum
      okelmann = {
        isNormalUser = true;
        home = "/home/okelmann";
        inherit (config.users.users.joerg) extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1008;
        openssh.authorizedKeys.keys = okelmannKeys;
      };

      # Simon Ellmann
      # tum
      ackxolotl = {
        isNormalUser = true;
        home = "/home/ackxolotl";
        inherit (config.users.users.joerg) extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1013;
        openssh.authorizedKeys.keys = ackxolotlKeys;
      };

      # Jiyang Chen
      # tum
      chenjiyang = {
        isNormalUser = true;
        home = "/home/chenjiyang";
        inherit (config.users.users.joerg) extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1019;
        openssh.authorizedKeys.keys = chenjiyangKeys;
      };

      # Charalampos Mainas
      # tum
      cmainas = {
        isNormalUser = true;
        home = "/home/cmainas";
        inherit (config.users.users.joerg) extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1020;
        openssh.authorizedKeys.keys = cmainasKeys;
      };

      # Masanouri Misono
      # tum
      masa = {
        isNormalUser = true;
        home = "/home/masa";
        inherit (config.users.users.joerg) extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1021;
        openssh.authorizedKeys.keys = masaKeys;
      };

      # Sebastian Reimers
      # tum
      sebastian = {
        isNormalUser = true;
        home = "/home/sebastian";
        inherit (config.users.users.joerg) extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1022;
        openssh.authorizedKeys.keys = sebastianKeys;
      };

      # Matthias Hille
      # tud
      matthias = {
        isNormalUser = true;
        home = "/home/matthias";
        inherit (config.users.users.joerg) extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1023;
        openssh.authorizedKeys.keys = matthiasKeys;
      };

      # Martin Kleppmann
      # tum
      martinkl = {
        isNormalUser = true;
        home = "/home/martinkl";
        inherit (config.users.users.joerg) extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1024;
        openssh.authorizedKeys.keys = martinklKeys;
      };

      root = {
        passwordFile = lib.optionalString config.users.withSops config.sops.secrets.root-password-hash.path;
        openssh.authorizedKeys.keys =
          joergsKeys
          ++ harshanavkisKeys
          ++ mauriceKeys
          ++ dimitraKeys
          ++ dimitriosKeys
          ++ redhaKeys
          ++ okelmannKeys
          ++ ackxolotlKeys;
      };
    };

    # DANGER ZONE!
    # Make sure all data is backed up before adding user names here. This will
    # delete all data of the associated user
    users.deletedUsers = [
      # User for Eurosys 22 artifact evaluation
      "reviewer"
      # Michio Honda
      "michio"
    ];

    # needed so that we can set a root password
    users.mutableUsers = false;
    nix.trustedUsers = ["joerg" "harshanavkis" "sandro" "redha"];

    # we cannot use this since we no longer have the database
    programs.command-not-found.enable = false;
    security.sudo.wheelNeedsPassword = false;
  };
}
