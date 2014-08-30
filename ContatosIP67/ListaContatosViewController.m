//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios4548 on 30/08/14.
//  Copyright (c) 2014 ios4548. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"

@implementation ListaContatosViewController

- (id)init{
    self = [super self];
    if (self) {
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
    }
    return self;
}

-(void) exibeFormulario{
    /*UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Exibir formulário" message:@"Isso é um UIAlertView" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];*/
    
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc]init];
    
    [self.navigationController pushViewController:form animated:YES];
}

@end
