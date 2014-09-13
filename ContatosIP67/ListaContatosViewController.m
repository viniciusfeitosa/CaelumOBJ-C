//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios4548 on 30/08/14.
//  Copyright (c) 2014 ios4548. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"
#import "Contato.h"

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
    form.contatos = self.contatos;
    
    [self.navigationController pushViewController:form animated:YES];
}

- (void) viewWillAppear:(BOOL)animated  {
    NSLog(@"Total cadastro: %d", [self.contatos count]);
    [self.tableView reloadData];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.contatos count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

@end
